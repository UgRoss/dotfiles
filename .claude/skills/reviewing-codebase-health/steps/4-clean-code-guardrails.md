# Step 4: clean code, architecture and guardrails

Often the code is clean and the guardrails are missing. Measure both.

## Code
- Counts of `any`, `@ts-ignore`, non-null assertions, casts. Each cast deserves a better narrowing (`instanceof`).
- Comments describe the code as it is (no "now", "no longer", "previously", refactor history). Never delete comments in this review unless provably false.
- Errors: fail loudly with a clear message where config or content can be missing; guard storage and clipboard APIs that can throw.
- File and component size; extract pure logic (search, filtering, pagination math) from large components so it can be tested.
- Exports nobody imports.

## Guardrails (trial, count, adopt or revert)
- **Lint**: strict + stylistic type rules, accessibility rules for the template language and for JSX, hooks rules. Prove they fire with a deliberate violation. Resolve peer-dependency warnings explicitly rather than ignoring them.
- **TypeScript**: strictest preset; disable only the single flag that produces framework-idiom noise, with a comment.
- **Tests**: the project's rule decides (see `AGENTS.md`; this user wants tests only for code that has logic, in nested `__tests__` folders, written test-first). Pure utilities and a CSS contrast guard are the usual targets. Run the red step, the green step, and for regressions a mutation check.
- **One command**: a `validate` script chaining format check, lint, type check, tests and build; CI runs exactly that.
- **CI**: check the last run with `gh run list`; note deprecated action versions and runner-image migrations.

## Report
Adopting a guardrail is a "Do now" when the current code passes it. If it would fail, report the count and offer the fix.
