# CLAUDE.MD -- Academic Project Development with Claude Code

<!-- HOW TO USE: This file configures Claude for the Baltic GDP Reconstruction Paper.
     Keep this file under ~150 lines — Claude loads it every session.
     See the guide at docs/workflow-guide.html for full documentation. -->

**Project:** Baltic GDP Reconstruction Paper
**Institution:** Emory University
**Branch:** main

---

## Core Principles

- **Plan first** -- enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** -- compile/render and confirm output at the end of every task
- **Single source of truth** -- LaTeX article in `Paper/` is authoritative; all tables and figures derive from source data
- **Quality gates** -- nothing ships below 80/100
- **[LEARN] tags** -- when corrected, save `[LEARN:category] wrong → right` to MEMORY.md

---

## Folder Structure

```
latvia-estonia-gdp-paper/
├── CLAUDE.md                    # This file
├── .claude/                     # Rules, skills, agents, hooks
├── Bibliography_base.bib        # Centralized bibliography
├── Paper/                       # Main LaTeX article source (.tex files)
├── Figures/                     # Figures and images (PDF, PNG)
├── Tables/                      # Generated LaTeX table files (from R)
├── Data/                        # Excel files: GDP series, source data
├── Preambles/                   # LaTeX preamble / header files
├── scripts/R/                   # R scripts for figure and table generation
├── quality_reports/             # Plans, session logs, merge reports
├── explorations/                # Research sandbox (see rules)
├── templates/                   # Session log, quality report templates
└── master_supporting_docs/      # Dissertation chapters, supporting papers
    ├── source_papers/           # PDFs of papers cited / used for analysis
    └── template_papers/         # Example papers for structure & style
```

---

## Commands

```bash
# LaTeX article (3-pass, XeLaTeX only)
cd Paper && TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode main.tex
BIBINPUTS=..:$BIBINPUTS bibtex main
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode main.tex
TEXINPUTS=../Preambles:$TEXINPUTS xelatex -interaction=nonstopmode main.tex

# R figure/table generation
Rscript scripts/R/figures.R
Rscript scripts/R/tables.R

# Quality score
python scripts/quality_score.py Paper/main.tex
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | PR | Submission draft quality |
| 95 | Excellence | Aspirational |

---

## Skills Quick Reference

| Command | Relevant? | What It Does |
|---------|-----------|-------------|
| `/compile-latex [file]` | ✓ | 3-pass XeLaTeX + bibtex |
| `/proofread [file]` | ✓ | Grammar/typo/overflow review |
| `/review-paper [file]` | ✓ | Full manuscript review |
| `/validate-bib` | ✓ | Cross-reference citations |
| `/review-r [file]` | ✓ | R code quality review |
| `/data-analysis [dataset]` | ✓ | End-to-end R analysis |
| `/lit-review [topic]` | ✓ | Literature search + synthesis |
| `/research-ideation [topic]` | ✓ | Research questions + strategies |
| `/interview-me [topic]` | ✓ | Interactive research interview |
| `/commit [msg]` | ✓ | Stage, commit, PR, merge |
| `/deep-audit` | ✓ | Repository-wide consistency audit |
| `/learn [skill-name]` | ✓ | Extract discovery into persistent skill |
| `/context-status` | ✓ | Show session health + context usage |
| `/deploy [LectureN]` | — | Slides only (N/A for paper) |
| `/extract-tikz [LectureN]` | — | Slides only (N/A) |
| `/visual-audit [file]` | — | Slides only (N/A) |
| `/pedagogy-review [file]` | — | Slides only (N/A) |
| `/qa-quarto [LectureN]` | — | Slides only (N/A) |
| `/slide-excellence [file]` | — | Slides only (N/A) |
| `/translate-to-quarto [file]` | — | Slides only (N/A) |
| `/devils-advocate` | — | Slides only (N/A) |
| `/create-lecture` | — | Slides only (N/A) |

---

## Paper Sections (Current State)

| Section | §  | File | Status | Target Words |
|---------|----|------|--------|-------------|
| Abstract | — | `Paper/main.tex` | Skeleton | 150 |
| Introduction | 1 | `Paper/main.tex` | Skeleton | 700 |
| Sources and Methodology | 2 | `Paper/main.tex` | Skeleton | 2,000 |
| Latvia: GDP per Capita 1940–1995 | 3 | `Paper/main.tex` | Skeleton | 2,200 |
| Estonia: GDP per Capita 1919–1995 | 4 | `Paper/main.tex` | Skeleton | 2,200 |
| Comparative Analysis | 5 | `Paper/main.tex` | Skeleton | 1,300 |
| Conclusion | 6 | `Paper/main.tex` | Skeleton | 500 |
| Online Data Appendix | A | `Paper/main.tex` | Skeleton | (not counted) |
