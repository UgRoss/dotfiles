# Step 2: framework best practices (Astro)

For another framework, keep the structure and swap the checks. Verify framework claims against the installed version (`node_modules/astro/dist/types`, `astro check` hints), not memory: APIs move between majors.

## Check
- **Collections**: glob loaders, schema helpers (`image()`), the supported zod import (deprecation hints from `astro check`), `z.enum` for fixed sets, a `draft` flag if content is authored over time. Collections read only through one filtered helper.
- **Routing**: typed `getStaticPaths`, `trailingSlash` set and pagination links consistent, rest-route collisions in one folder.
- **Islands**: every `client:*` directive justified. Count JS per page type from the build (`astro-island` count, `dist/_astro/*.js`). Report the cost of each island and the lighter alternative; framework removal is a decision for the user, not a default.
- **Assets**: `astro:assets` for images, `priority` on the LCP image, the Fonts API (preload, metric-adjusted fallback, woff2 only) instead of CSS imports, font weight in bytes.
- **Scripts**: bundled `<script>` for behavior; `is:inline` only for pre-paint work; `define:vars` to share a constant with an inline script.
- **Config**: `site` real, integrations all used (MDX with no MDX features is a decision, not an error), prefetch, path alias, strictest tsconfig.
- **Dates**: content dates parse to UTC; formatting must be UTC (build under two timezones to prove it).
- **View transitions**: absent is fine; adding them means re-wiring scripts after swap.

## Report
Separate "bug or deprecated" from "tuning". Ask before dropping a dependency or integration.
