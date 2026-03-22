# KIdeKu Abschlussbericht — Quarto-Projekt

Quarto-Buchprojekt für den Abschlussbericht des Projekts
*„Chancen von KI zur Stärkung unserer deliberativen Kultur"* (KIdeKu).

## Ausgabeformate und Profile

Das Projekt verwendet [Quarto Profiles](https://quarto.org/docs/projects/profiles.html),
um zwei unterschiedliche Ausgaben aus derselben Quellbasis zu erzeugen:

| Profil | Format | Kapitelstruktur |
|--------|--------|-----------------|
| `html` (Standard) | Mehrseitige Website | Vorwort → Einleitung → … |
| `pdf` | PDF (LaTeX/`sdqtechreport`) | Einleitung → … (kein Vorwort) |

Die profilspezifischen Kapitelstrukturen sind in `_quarto-html.yml` bzw. `_quarto-pdf.yml` definiert. Der Pre-Render-Hook `pre-render.sh` befüllt `index.qmd` automatisch mit dem jeweils passenden Inhalt (siehe unten).

## Rendern

### HTML-Ausgabe (Standard)

```bash
quarto render
```

Erzeugt die mehrseitige HTML-Website im Verzeichnis `_book/`.

Alternativ für die Live-Vorschau im Browser:

```bash
quarto preview
```

### PDF-Ausgabe

```bash
quarto render --profile pdf --to pdf
```

Erzeugt `_book/<titel>.pdf`.

