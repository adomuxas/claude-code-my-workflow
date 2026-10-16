---
Status: COMPLETED
Date: 2026-04-03
Objective: Adapt forked academic workflow (pedrohcgs/claude-code-my-workflow) for Baltic GDP Reconstruction Paper
---

## Objective
Configure the slide-centric template workflow for a LaTeX journal article project on Baltic GDP reconstruction (Latvia 1940–1995, Estonia 1919–1995) at Emory University.

## Changes Made

| File | Change | Reason |
|------|--------|--------|
| `CLAUDE.md` | Filled all placeholders; updated folder structure, commands, skills table, project state | Primary config must reflect actual project |
| `.claude/agents/domain-reviewer.md` | Replaced generic econometrics lenses with 5 economic history lenses | Review agent must match actual domain |
| `.claude/rules/constitutional-governance.md` | Created new; 5 articles for article workflow | Article projects have different governance needs than slides |
| `Paper/` | Created directory | Primary article source location |
| `Data/` | Created directory | Excel source data |
| `Tables/` | Created directory | R-generated LaTeX tables |
| Memory files | Created user_profile.md, project_context.md | Persist project context across sessions |

## Design Decisions

| Decision | Rationale |
|----------|-----------|
| Keep `Slides/` folder (empty) | Preserve option for conference presentation later |
| Mark slide-only skills with `—` in CLAUDE.md rather than deleting | Skills still exist if needed; table gives clear signal of what's relevant |
| Single main.tex (not multi-file) | User confirmed single file approach |
| `Paper/` not `Slides/` for article | Naming clarity; `Slides/` implies Beamer presentation |

## Verification
- [x] CLAUDE.md has no `[PLACEHOLDER]` strings
- [x] `Paper/`, `Data/`, `Tables/` directories exist
- [x] domain-reviewer.md uses economic history lenses
- [x] constitutional-governance.md exists with 5 articles
- [x] Memory files written to `.claude/projects/.../memory/`

## Open Questions / Next Steps
- User needs to add their LaTeX preamble to `Preambles/`
- User needs to create `Paper/main.tex` when writing begins
- Bibliography entries to be added to `Bibliography_base.bib` as needed
- R figure/table scripts to be added to `scripts/R/` when data analysis begins
