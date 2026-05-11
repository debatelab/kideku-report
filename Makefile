.PHONY: all html pdf clean preview help

# Default target: render both HTML and PDF
all: html pdf

# Render HTML output (landing_page.qmd → index.qmd)
html:
	@echo "Rendering HTML output..."
	quarto render --profile html --to html

# Render PDF output (einleitung.qmd → index.qmd)
# Use temporary output directory to avoid cleaning docs/, then move PDF
pdf:
	@echo "Rendering PDF output..."
	@mkdir -p .tmp-pdf
	quarto render --profile pdf --to pdf --output-dir .tmp-pdf
	@mv .tmp-pdf/*.pdf docs/ 2>/dev/null || true
	@rm -rf .tmp-pdf

# Start live preview server (HTML only)
preview:
	@echo "Starting preview server..."
	quarto preview --profile html

# Clean generated output
clean:
	@echo "Cleaning output directory..."
	rm -rf docs/*
	rm -rf .quarto

# Show available targets
help:
	@echo "Available targets:"
	@echo "  make         - Render both HTML and PDF (default)"
	@echo "  make all     - Render both HTML and PDF"
	@echo "  make html    - Render HTML output only"
	@echo "  make pdf     - Render PDF output only"
	@echo "  make preview - Start live preview server (HTML)"
	@echo "  make clean   - Remove generated output"
	@echo "  make help    - Show this help message"
