# Step 6: everything else worth checking

## Sharing and SEO
Head audit across every built page: title (with site suffix), description, canonical, Open Graph, Twitter card, `theme-color`, icons, `noindex` on the 404. Sitemap and `robots.txt`, feed metadata (categories, language). A default social image and a per-content image rule. Icons rendered for the brand (svg, ico, 180px touch icon). A rendered image with baked-in text is a maintenance note in the docs.

## Dependencies
- `pnpm audit` (note transitive and unpatchable ones; try updating the transitive within range before adding overrides), `pnpm outdated`.
- Apply patch and minor updates with the gate. Try each major on its own with the full gate; revert and record the blocker when a tool rejects it (a linter that does not support the new compiler, for example).
- Dead or duplicate package-manager config, stale version pins, unmet peers. Prove removals with a clean-room install.
- Packages used by one function: report, usually leave.

## Performance
Sizes raw and gzip, JS per page type, font bytes. Report only what is large relative to the project's "simple and fast" goal.

## Accessibility beyond the look
Live region for dynamic result counts, landmarks and heading outline per page, labels for icon-only controls, alt text policy for decorative versus meaningful images, focus order. Respect rejected items in the review log (this user rejected a skip link).

## Content pipeline
Drafts and future-dated content, schema strictness for fixed sets, whether the import skill or script still matches the collections.

## Docs and process drift
README, `AGENTS.md`, `CONTEXT.md` and ADRs against the code: commands, folder layout, vocabulary, superseded decisions marked. Update docs only when the user asked or the repo rules say to; otherwise list the drift.

## Deployment
Host-dependent items (headers, CSP) stay deferred until a host is chosen; record them.
