# Plan: Screen the rest of `newsources/` and add page-referenced citations to the Latvia paper

**Date:** 2026-10-17
**Status:** COMPLETED 2026-10-17 (merged via PR)
**Branch:** feat/latvia-newsources-citations (from main @ 87f112d)

## Context
- `newsources/` holds 2,790 page-text folders (71,310 files; `_bibinfo.txt` citation + `pNNNN.txt` printed-page texts, most with `manifest.json`).
- The first literature pass screened 947 folders (`master_supporting_docs/latvia_paper_literature/`), produced two page-referenced fact files in `quality_reports/lit/`, and 109 bib entries in `Paper/latvia/bibliography_lit.bib`, of which 24 are cited.
- The other 1,843 folders were never screened for Latvia. 102 of the paper's 138 citations come from the Estonia paper's `bibliography.bib`, and their text was drafted from the dissertation, not from newsources page text.

## Deliverables
1. `quality_reports/lit/2026-10-17_latvia_newsources_screen.csv` — every unscreened folder with Latvia/Baltic hit counts and relevance verdict.
2. `quality_reports/lit/2026-10-17_latvia_newsources_round2_facts.md` — page-referenced fact sheets from the newly relevant folders (plus BIB ENTRIES block).
3. `Paper/latvia/bibliography_lit.bib` — new entries (keys `surname_year_firstword`, matching existing convention).
4. `Paper/latvia/sections/0[1-6]_*.tex` — `\parencite[pp]{key}` added where the newsources page text supports a claim that is currently uncited or cited without pages; wording corrected where the source contradicts the text (logged).
5. Rebuilt `Paper/latvia/main.pdf`; session log; this plan.

## Steps
1. Screen: grep every `pNNNN.txt` for Latvia terms (Latvia/Lettland/Latvij-/Riga/Courland/Latgale/… incl. Cyrillic) and Baltic terms; aggregate per folder; join with `_bibinfo.txt`; keep unscreened folders with ≥1 Latvia-page or ≥3 Baltic-pages; classify by theme (interwar / Soviet / transition-modern / comparative-method).
2. Extract: parallel agents (one per theme batch, ≤~60 folders each) read the hit pages in full and write page-referenced facts relevant to the paper's claims, with `_bibinfo.txt`-based bib entries. Instruction: printed page numbers, no paraphrase drift, flag contradictions with the paper.
3. Cite: one agent per section (02–05 mainly; 01, 06 light) takes the section text + all fact files + direct access to newsources pages, and inserts `\parencite[pages]{key}` only where it has confirmed the page text supports the sentence; reports every insertion and any claim it could not support. Orchestrator reviews the diff for key validity and style (`\parencite`/`\parencites`, en-dash page ranges).
4. Bib: merge new entries into `bibliography_lit.bib`; check key uniqueness across the four bib files.
5. Build: xelatex → biber → xelatex ×2 inside `Paper/latvia/`; require 0 undefined citations, 0 overfull boxes.
6. Review: domain-reviewer spot-checks ≥25 new citations against page text; fix; rebuild.
7. Score, session log, commit on branch, PR + merge via GitHub API (gh absent).

## Verification
- `biber` log: 0 "not found"; build log: 0 errors, 0 overfull.
- Every new citekey resolves to a folder in `newsources/` and the cited pages exist as `pNNNN.txt` there.
- Count of page-referenced citations per section before/after recorded in the session log.

## Risks
- Agents citing pages that do not say what the sentence says → mitigated by requiring the agent to quote the supporting line in its report, and by the spot-check.
- Over-citation clutter → cap at the claims that are substantive (numbers, events, attributions), not every sentence.
