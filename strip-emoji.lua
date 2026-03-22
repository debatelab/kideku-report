-- strip-emoji.lua
-- Strip emoji (and variation selector) code points when rendering to PDF/LaTeX,
-- so they don't leave invisible blank characters in the output.

local function is_emoji(code)
  return (code >= 0x1F000 and code <= 0x1FFFF) -- Misc symbols, pictographs, etc.
      or (code >= 0x2600  and code <= 0x26FF)  -- Misc symbols
      or (code >= 0x2700  and code <= 0x27BF)  -- Dingbats
      or (code >= 0xFE00  and code <= 0xFE0F)  -- Variation selectors
      or (code >= 0xE0000 and code <= 0xE01FF) -- Tags
end

local function strip_emojis(s)
  local result = {}
  for _, code in utf8.codes(s) do
    if not is_emoji(code) then
      result[#result + 1] = utf8.char(code)
    end
  end
  return table.concat(result)
end

function Str(el)
  if FORMAT == "latex" then
    el.text = strip_emojis(el.text)
    return el
  end
end
