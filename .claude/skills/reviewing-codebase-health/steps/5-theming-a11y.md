# Step 5: theming, light and dark, accessibility of the look

Visual judgment belongs to the user. Measure everything measurable, change tokens only with their approval, and finish with a checklist for them. Never start a dev server or take screenshots here unless they ask.

## Tokens
- One semantic token set; each color defined once (a `light-dark()` pair, or equivalent), no hardcoded colors or `dark:` variants in markup (grep for hex, `rgb(`, `dark:`).
- Count token usage; flag unused tokens and near-duplicates.
- Type scale and heading weight/tracking live on the type tokens, not repeated utility strings.
- No workaround machinery whose original need is gone; verify the need first (find the cases it handles).

## Theme contract
- Which file sets the theme, which stores it, which reads it, which styles it. Shared constants instead of repeated string literals.
- Behavior matrix: system light/dark, explicit choice, no storage, no JavaScript, system change while open, code-block colors in every case.
- Storage writes guarded; toggle label reflects state.

## Contrast (compute, do not eyeball)
For both themes: ink, strong, muted on every background they sit on (page, surface, hover highlight, code chip, placeholder). Syntax-highlighting colors against the code-block background (extract the `--shiki-*` or equivalent colors from built HTML and compute each). Markers that carry meaning (list bullets, dividers, borders that separate regions) need 3:1. Text 4.5:1, control borders 3:1. Inline links need 3:1 against body text or a visible underline. Hover and focus indicators must be distinguishable, with a keyboard focus outline where the highlight is faint. Prefer a committed test that reads the real tokens; add every new token to it.

## Close with
A visual checklist (light and dark: text, borders, hover, code blocks, headings, toggle, focus) for the user to run.
