# Step 3: coupling and coherence

Goal: can one part change without silent breakage elsewhere, and does the project speak with one voice?

## Check
- **Layering**: imports flow pages → layouts → components → utils/data. Grep for upward imports; zero is a finding to report.
- **Fan-in**: which modules are shared by many files (good) and which "shared" things have one user.
- **String contracts**: class names, `data-` attributes, storage keys and element ids used as hooks between a script and markup. List every file that mentions each. Fix by defining the name once (a CSS class that is both hook and style, a shared constant passed with `define:vars`).
- **Cross-framework duplication**: the same markup in an Astro component and a React component.
- **Server-only imports in client code**: a client component importing a module that imports server APIs, even type-only.
- **Route knowledge**: URLs built by hand in several places; one helper per route family taking plain ids (client-safe).
- **Data flow**: some components import their data while siblings receive props; pick pages-supply-data.
- **Coherence of words**: nav label, document title, `h1`, home section and route for the same thing; compare with the glossary. Mismatches are findings; the user picks the wording.
- **Duplicated behavior**: two implementations of pagination, headings, etc. Note why an ADR may justify it before proposing a merge.
- **Choreography**: constants spread across files (animation delays).

## Leave alone
Near-twin components under ~40 lines, single-use composition components that read well, and anything an ADR defends.
