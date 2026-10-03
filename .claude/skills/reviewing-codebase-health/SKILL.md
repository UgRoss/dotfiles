---
name: reviewing-codebase-health
description: Use when asked to review a project's health, run a periodic codebase review or cleanup audit, check for drift, tech debt, outdated dependencies, accessibility or theming regressions, or keep a codebase clean over time ("review the project", "health check", "do the review again").
---

# Reviewing Codebase Health

A repeatable, evidence-first review, run one step at a time. Every step ends with a report, a plan the owner approves, the fixes, and verification. The next step starts only after that.

## Step 0: orient (required before any step)

1. Read the repo's instructions (`AGENTS.md`/`CLAUDE.md`; run `ls -la`, one may be a symlink), `CONTEXT.md`, ADRs, the TODO doc, `docs/internal/review-log.md` if present, and `git log --oneline -20`.
2. Run the project's gate command. Record baseline metrics (`evidence-recipes.md`).
3. Pick the mode (see Modes below) and name it in your first line.

**Modes.** Full (steps 1-6): no review log, or the owner says "full", "everything", "all" or "thorough". Quick: a log exists and the owner says "again", "quick" or "since", or gives no mode word. Quick scopes to `git diff <last-reviewed-sha>..HEAD`, re-measures the log's metrics, and gives one combined report. "step N" runs that step only, and so does a named topic: structure → 1, framework or Astro → 2, coupling → 3, architecture or code quality or tests or lint → 4, theming or dark mode or accessibility → 5, dependencies or SEO or performance or docs → 6. Say how to switch modes. If nothing changed since the last reviewed commit, say so, re-measure, and offer a full review.

## The loop, per step

1. Read `steps/N-*.md`; gather evidence with `evidence-recipes.md`.
2. Write the report in the shape of `report-template.md`. **End your turn there**, with Decisions for you and the proposed plan.
3. After approval: implement in commits grouped by theme, new logic test-first, gate green, build diff for pure refactors.
4. Close with the summary from the template and the name of the next step. Wait for "go".

| Step | File |
| :-- | :-- |
| 1 Code solutions and organization | `steps/1-code-organization.md` |
| 2 Framework best practices | `steps/2-framework-practices.md` |
| 3 Coupling and coherence | `steps/3-coupling-coherence.md` |
| 4 Clean code, architecture, guardrails | `steps/4-clean-code-guardrails.md` |
| 5 Theming, light/dark, a11y of the look | `steps/5-theming-a11y.md` |
| 6 Everything else | `steps/6-other.md` |
| 7 Wrap-up | below |

**Step 7:** prepend an entry to `docs/internal/review-log.md` (date, last reviewed commit, metrics table, decisions, deferred items), list docs drift, refresh the TODO doc. Create `docs/internal/` and make sure it is gitignored if missing.

## Rules (no exceptions)

- **No edits before the owner approves that step's plan.** "Go fast" and "just fix everything" mean shorter reports, not skipped approval. Skip the gate only if the owner says explicitly not to check in.
- **Evidence before claims.** Do not call docs stale, files duplicated or code unused until a command you ran shows it. Memory notes and earlier summaries can be wrong; the code is the truth.
- **Decided means decided.** Anything in the review log, TODO, ADRs or recent commits is not re-proposed unless the facts changed; then say what changed.
- Follow the repo's own rules (commit style, test location, TDD, no unrelated edits, never commit `docs/internal`). Never skip hooks.
- Visual judgment belongs to the owner: never start a dev server or take screenshots; end with a checklist for them.
- Unrelated bugs go on the TODO, not into the current fix.

## Red flags

| Thought | Reality |
| :-- | :-- |
| "I'll do all steps in one report" | One step per report; the gates are the point. |
| "They're in a hurry, I'll fix as I go" | Hurry shortens the report. Approval still comes first. |
| "That doc looks stale" | Run the command that proves it (symlink? last commit?). |
| "This dependency seems pointless" | Check the log and recent commits for why it exists. |
| "Looks fine, ship it" | Say what was measured and what only the owner can see. |
