# Step 1: code solutions and organization

Goal: is the code where a newcomer would look for it, and is anything duplicated, misplaced or dead?

## Map first
`git ls-files`, line counts per file (`wc -l`, sort), entry points, config files, content layout. Read every source file in small projects; sample in large ones.

## Look for
- **Copy-pasted shells and markup**: the same wrapper or class string in 3+ files (one shared component).
- **Duplicated logic**: the same mapping or formatting in several pages; a utility module that exists but is bypassed (pages importing the date library directly).
- **Misplaced types**: types living in a data file or a server-only module while client code imports them; a framework type that already exists (`MarkdownHeading`) re-declared.
- **Dead code**: unused components, props, exports, design tokens, CSS classes with no rule or script behind them (see evidence recipes). Framework conventions are not dead.
- **Copy placement**: is page-specific text inline in the page and shared data in `data/`, applied consistently?
- **Housekeeping**: placeholder package name or `site` URL, fallbacks that hide missing config, type packages in the wrong dependency group, formatter failing on a file.
- **Schema versus glossary drift**: field names that disagree with the project's vocabulary file.
- **Docs that contradict the repo** (instructions saying "no linter" when one exists). Verify against the files before claiming staleness.

## Verify fixes
Run the gate command. For pure refactors, prove the built output is unchanged with the before/after build diff.
