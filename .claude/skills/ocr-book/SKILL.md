---
name: ocr-book
description: |
  OCR workflow for transcribing photos of a Lithuanian typewritten book into a
  faithful LaTeX PDF. One PDF page per photo, correct book page numbers, tables
  reproduced as LaTeX tabular environments, footnotes preserved.
  Use when: user says "/ocr-book", provides a folder of book page photos, or
  wants to continue transcribing the Lithuanian economic history book.
author: Claude Code Academic Workflow
version: 1.0.0
argument-hint: "[folder path or page range]"
---

# OCR Book — Lithuanian Typewritten Book Transcription

## Problem
Transcribe 100+ phone photos of a Lithuanian typewritten book into a clean,
faithful LaTeX PDF. Each photo = one PDF page. Page numbers, tables, footnotes,
and section headers must match the original.

## Context / Trigger Conditions
- User invokes `/ocr-book` or asks to continue OCR work
- Photos are JPGs in `OCR/` folder (or subfolder specified as argument)
- Book is in Lithuanian; content is interwar Lithuanian economic history
- Output file: `OCR/book_pages.tex` (append new pages to existing file, or
  create a new file per batch — agree with user at session start)

## Workflow

### Step 1 — Inventory the folder
```
Glob: OCR/**/*.jpg (or the folder the user specifies)
```
List all images, confirm count with user, ask which pages to process this session.

### Step 2 — Pre-read all images in parallel
Read all images in a single parallel batch (up to ~12 at once to stay within
context). Record for each image:
- Book page number (visible at bottom of page, or inferred from sequence)
- Content type: text-only | table-only | mixed (table + text)
- Any special elements: section headers, footnotes, mid-word page breaks

Build a page inventory table before writing any LaTeX.

### Step 3 — Confirm page order and inferred page numbers
Some table-only pages have no visible page number. Infer from sequence and
confirm with user before writing. Example: if p.133 references "38 lentelė"
and the next photo is that table, it is p.134.

### Step 4 — Re-read table images before writing
For data accuracy, re-read each table image immediately before transcribing it.
Never rely solely on memory for table numbers.

### Step 5 — Write the LaTeX file

#### Document preamble (established defaults):
```latex
\documentclass[11pt]{article}
\usepackage{fontspec}
\usepackage[lithuanian]{babel}
\usepackage[a5paper, top=1.8cm, bottom=2.2cm, left=2.2cm, right=1.5cm]{geometry}
\usepackage{booktabs}
\usepackage{array}
\usepackage{multirow}
\usepackage{makecell}
\usepackage[normalem]{ulem}
\usepackage{indentfirst}

\setmainfont{Times New Roman}
\pagestyle{plain}
\setlength{\parindent}{1.5em}
\setlength{\parskip}{0pt}
\renewcommand{\thefootnote}{\arabic{footnote}}
```

#### Page structure:
- `\setcounter{page}{N}` at start of document (first book page number)
- `\newpage` between every page section — no exceptions
- Pages that start mid-sentence: use `\noindent` (no paragraph indent)
- Pages that end mid-word (page break hyphen): reproduce the hyphen before `\newpage`

#### Tables:
- Table number label: `\noindent\hfill\textit{NN lentelė}`
- Table title: `\begin{center}\textit{Title text}\end{center}` — break long
  titles with `\\` if they exceed line width
- Font sizes by table width:
  - Narrow (≤5 cols): `\small`, `\tabcolsep=3pt`
  - Medium (6–8 cols): `\footnotesize`, `\tabcolsep=2.5pt`
  - Wide (9–12 cols): `\scriptsize`, `\tabcolsep=1.5–2pt`
- **Critical**: `\multirow{N}{*}{...}` ignores column width. Always use
  explicit width: `\multirow{N}{2.8cm}{\raggedright text}` for p{} columns.
- Table footnotes (* marks): place after table with `\noindent\rule{Xcm}{0.4pt}`
  then `\noindent{\footnotesize * footnote text}`
- Russian Cyrillic in footnotes: include directly (XeLaTeX handles UTF-8).
  Wrap in `{\footnotesize\raggedright ...\par}` to prevent overflow.

#### Numbered text footnotes:
- Set `\setcounter{footnote}{N-1}` before the first footnote in the document
- Use `\footnote{...}` inline — LaTeX places it at page bottom automatically
- Counter auto-increments for subsequent footnotes

#### Section headers (underlined, centered):
```latex
\begin{center}
\uline{4.5. Section title first line} \\[-2pt]
\uline{continuation line} \\[-2pt]
\uline{further continuation}
\end{center}
```

### Step 6 — Compile and fix overflows
```bash
cd OCR && xelatex -interaction=nonstopmode book_pages.tex 2>&1 | \
  grep -E "^(\[|Output|Overfull.*too wide|Overfull.*too high)"
```

**Accept:** overflows ≤6pt (sub-2mm, invisible in print)
**Fix:** overflows >6pt — reduce tabcolsep or font size for that table
**Target:** page count = number of photos processed

### Step 7 — Append vs new file
- **Continuing existing file**: remove `\end{document}`, append new page
  sections, re-add `\end{document}`, recompile full file.
- **New batch file**: use separate `.tex` file, adjust `\setcounter{page}{N}`
  to match the first new page number.

## Known Issues & Fixes

| Issue | Fix |
|-------|-----|
| `\multirow{N}{*}` overflows p{} column | Use explicit width: `\multirow{N}{2cm}{...}` |
| Long table title overflows | Break with `\\` in `\textit{...}` |
| Russian Cyrillic in footnote overflows | Wrap in `\raggedright...\par` |
| Page count > photo count | A text page has too much content; reduce font or trim |
| Table too wide (>20pt) | Reduce to next smaller font size + tighter tabcolsep |
| `\vbox too high` on table page | Table slightly tall; reduce font size |

## Folder Structure
```
OCR/
├── *.jpg              # Source photos (named by camera timestamp)
├── book_pages.tex     # LaTeX source (cumulative across sessions)
└── book_pages.pdf     # Compiled output
```

## Session Continuity
At the start of each `/ocr-book` session:
1. Read `OCR/book_pages.tex` to find the last page number already transcribed
2. List remaining photos not yet transcribed
3. Confirm with user which batch to process next
4. Append to existing file (don't recreate from scratch)

## Example Invocation
```
/ocr-book
```
Claude will: inventory OCR/ folder, identify already-done pages, propose next
batch, read images, transcribe to LaTeX, compile, report results.

## References
- Session log: `quality_reports/session_logs/2026-04-17_ocr-and-book-discussion.md`
- Compiled example: `OCR/book_pages.tex` (pages 133–144, first batch)
- Book subject: Lithuanian interwar economic history (Soviet-era Lithuanian monograph)
