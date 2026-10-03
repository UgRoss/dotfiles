# Evidence recipes

Measure, then judge. Do scratch work in the session scratchpad directory, never in the repo. Use `node` for scripting (system `python3` can be blocked by an unaccepted Xcode license). Quote globs in zsh (`--include='*.astro'`). Never run `cat > file` without a heredoc; it waits on stdin forever.

## Baseline metrics (record in the review log)

Capture the gate's exit status explicitly: `pnpm validate > /tmp/validate.log 2>&1; echo "exit: $?"`, then grep the log. Piping the gate through `tail` or `grep` hides a failing exit code.

Never run two builds of the same repo at once (parallel agents, a watch task): they share `dist/` and fail with confusing `ENOENT` errors on manifest files. If a gate fails once and passes on rerun, say so, and check for concurrent builds before blaming the code.

- Test count and the gate command's result (`pnpm validate`, or whatever `AGENTS.md` names).
- `pnpm audit` severity counts, `pnpm outdated` (note majors separately).
- Build size: page count, CSS/JS/font bytes raw and gzip (`gzip -c f | wc -c`), JS shipped per page type.
- Lowest contrast ratio from the contrast test, if the repo has one.

## Before/after build diff (proves a refactor changed nothing visible)

```bash
S=<scratchpad>; pnpm build >/dev/null && rm -rf $S/before && cp -R dist $S/before
# ...make the change, then:
pnpm build >/dev/null
norm(){ sed -E 's/\.[A-Za-z0-9_-]{8}(_[A-Za-z0-9_-]+)?\.(webp|css|js|woff2?)/.H.\2/g; s/uid="[^"]*"//; s/></>\n</g' "$1"; }
for f in $(cd $S/before && find . -name '*.html'); do diff <(norm $S/before/$f) <(norm dist/$f) | grep '^[<>]'; done | cut -c1-200 | sort | uniq -c | sort -rn | head
```
Only the changes you intended should appear (renamed classes, comment indentation, hashed filenames).

## Strictness trials (try, count, revert)

- Lint: write a temporary `eslint.tmp.config.mjs` adding `tseslint.configs.strict`, `stylistic`, the framework's a11y config and `react-hooks`; run `npx eslint -c eslint.tmp.config.mjs .`; delete it. Prove rules fire by linting a file with a deliberate violation (`<img src>` without alt).
- TypeScript: swap `extends` to the `strictest` preset, run the type check, `git checkout tsconfig.json`. If one flag causes all the noise (`exactOptionalPropertyTypes`), adopt the rest.
- Package plugins: `pnpm add -D x`, trial, then restore `package.json` and the lockfile from copies if not adopting.

## Dead code and coupling

- Unused exports: for each `export` name, `grep -rw name src | grep -v ownfile`. Framework conventions (`GET`, `collections`) are not dead.
- String contracts: grep class names or attributes used as script hooks and list every file that mentions them.
- Layering: grep for upward imports (components importing layouts or pages, utils importing components). Zero hits is a finding worth reporting.
- Token usage: count utility classes per design token; flag tokens with zero uses.

## Timezone and locale bugs

Build under a west-of-UTC zone and under a far-east one, then grep the rendered dates: `TZ=America/Los_Angeles pnpm build`, `TZ=Pacific/Auckland pnpm build`. Content dates parse to UTC midnight, so local-time formatting shows the wrong day.

## Contrast math (WCAG 2.1)

Text needs 4.5:1, UI component boundaries 3:1, and a non-underlined inline link needs 3:1 against surrounding text. Compute with relative luminance: `channel = c/255; c<=0.04045 ? c/12.92 : ((c+0.055)/1.055)**2.4`, `L = .2126R+.7152G+.0722B`, ratio `(Lmax+.05)/(Lmin+.05)`. Check every text token against every background it sits on (page, surface, hover highlight, code chip). Prefer a committed test that reads the real tokens over a one-off script.

## Built-output audits

- Head audit: for each built page, extract `<title>`, description length, canonical, `og:*`, `twitter:*`, `h1` count, landmarks.
- JS shipped: islands per page (`grep -c astro-island`), and `ls -la dist/_astro/*.js`.
- Dev-only paths: a `draft` fixture in a scratch edit, build, confirm absence from pages, listings and feeds, then `git checkout content`.

## Regression-test honesty

After adding a regression test, reintroduce the old bug temporarily (copy the file, edit, run, restore) and confirm the test fails with the old symptom.

## Clean-room install

`rsync -a --exclude node_modules --exclude dist --exclude .git ./ $S/ && cd $S && pnpm install --frozen-lockfile && pnpm build` proves dependency or lockfile cleanups are safe.
