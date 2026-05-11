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

### Beide Formate (empfohlen)

```bash
make
```

Rendert sowohl HTML- als auch PDF-Ausgabe. Der Pre-Render-Hook wird für jedes Format separat mit dem korrekten Profil aufgerufen, sodass `index.qmd` jeweils das richtige Inhalt erhält (Vorwort für HTML, Einleitung für PDF).

**Hinweis:** `quarto render` ohne explizites Profil führt den Pre-Render-Hook nur einmal aus und kann daher nicht beide Formate korrekt erzeugen. Verwenden Sie daher `make` oder die einzelnen Targets unten.

### HTML-Ausgabe

```bash
make html
# oder: quarto render --profile html
```

Erzeugt die mehrseitige HTML-Website im Verzeichnis `docs/`.

Alternativ für die Live-Vorschau im Browser:

```bash
make preview
# oder: quarto preview --profile html
```

### PDF-Ausgabe

```bash
make pdf
# oder: quarto render --profile pdf --to pdf
```

Erzeugt `docs/<titel>.pdf`.

### Weitere Makefile-Targets

```bash
make clean   # Löscht das gesamte docs/ Verzeichnis
make help    # Zeigt alle verfügbaren Targets
```


