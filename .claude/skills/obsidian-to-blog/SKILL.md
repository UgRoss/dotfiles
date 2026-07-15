---
name: obsidian-to-blog
description: >
  Imports content from Ross's Obsidian vault into the rossug.me Astro blog.
  Use this skill whenever Ross wants to publish, sync, or import content from
  Obsidian to the blog — including TILs/notes, book entries, or blog posts.
  Trigger on phrases like "publish from obsidian", "import TIL", "sync books",
  "pull from vault", "add this note to blog", "import my obsidian notes", or
  any request to move vault content to the website.
---

# Obsidian → Blog Importer

Ross's vault lives at:
```
/Users/ross/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal/
```

The blog lives at: `/Users/ross/Code/rossug.me/`

## Step 1: Clarify scope

If not already specified, ask Ross:
- **What to import**: TILs, books, or blog posts (can be all three)
- **Which items**: specific notes by name, all unpublished, or a date range

You can browse the vault with direct filesystem reads or `obsidian search` if Obsidian is open.

---

## Drafts

Any vault file whose **filename starts with `_`** is a draft — skip it entirely across all content types (TILs, books, posts). Do not create a blog file for it or mention it in the summary unless Ross specifically asks about drafts.

---

## Content Type: TILs → Notes

**Vault source**: `03 - Knowledge/TILs/*.md`
**Blog destination**: `content/notes/`

### Frontmatter mapping

| Vault field | Blog field | Transform |
|---|---|---|
| `date` | `pubDate` | Keep as-is (YYYY-MM-DD) |
| H1 heading | `title` | Extract from `# Title` line |
| `tags` like `til/devtools` | `category` | Take the part after `/`, title-case it |
| First non-heading paragraph | `excerpt` | Optional; 1-sentence summary |
| `updated` | `updateDate` | Optional; keep if present |

### Content transform

- Strip the `## Related` section entirely
- Convert `[[Wikilinks]]` to plain text (just the link text, no brackets)
- Convert `[[Link|Display]]` to just `Display`
- Remove Templater artifacts like `{ date }:` keys
- **Image alt text**: for every inline image, write a meaningful alt text:
  1. If the original alt is a real description (not a filename), keep it as-is
  2. If the alt is a raw filename or missing — **read the image** and write a concise, descriptive alt based on what you actually see (e.g. "Singly linked list diagram with three nodes showing Data and Next fields, Head and Tail labels, ending in NULL")
  3. Only fall back to humanizing the filename (strip extension, replace `-`/`_` with spaces, title-case) if the image cannot be read (e.g. GIF animation)

### Filename

Convert the H1 title to kebab-case: `"Bubble Sort"` → `bubble-sort.md`

### Output format

```markdown
---
title: 'Bubble Sort'
pubDate: 2020-11-01
category: 'Algorithms'
excerpt: 'A simple comparison-based sorting algorithm that bubbles largest elements to the end.'
---

[body content without Related section]
```

---

## Content Type: Books

Books require two vault files:
- **Tracking note** (`06 - Tracking/Books/<Title>.md`) — has metadata
- **Summary note** (`03 - Knowledge/Books/Summaries/<Title>.md`) — has content

**Blog destination**: `content/books/`

### Frontmatter mapping

| Vault field | Blog field | Transform |
|---|---|---|
| `title` | `title` | Keep as-is |
| `author` (array) | `author` | Join with `', '` if multiple |
| `rating: ⭐⭐⭐⭐` | `rating` | Count ⭐ chars → integer (0 if empty/unrated) |
| `status: done` | `status: 'finished'` | See status map below |
| `cover: "[[attachments/x.jpg]]"` | `cover: './_assets/x.jpg'` | Extract filename, copy image |
| First line of summary body | `summary` | One-sentence description |

**Status map**:
- `done` → `'finished'`
- `reading` → `'reading'`
- `unread` / empty / anything else → `'wishlist'`

### Cover image handling

1. Extract filename from `[[attachments/cover.jpg]]`
2. Source path: `06 - Tracking/Books/attachments/<filename>`
3. Copy to: `content/books/_assets/<filename>`
4. Set frontmatter: `cover: './_assets/<filename>'`

If cover is missing or the file doesn't exist, omit `cover` and note it for Ross.

### Content

Use the **summary note** body as the book entry content. If no summary exists, use an empty body and note it.

Strip wikilinks: `[[Note Name]]` → plain text, `[[Note|Display]]` → `Display`.

### Output format

```markdown
---
title: 'Clean Code'
author: 'Robert C. Martin'
cover: './_assets/clean-code.jpg'
rating: 4
status: 'finished'
summary: 'Principles and practices for writing clean, readable, and maintainable code.'
---

[body from summary note]
```

### Filename

Kebab-case the title: `"Clean Code"` → `clean-code.md`

---

## Content Type: Blog Posts

**Vault source**: `02 - Projects/Personal Site/Posts/`

**Blog destination**: `content/posts/`

### Frontmatter mapping

| Vault field | Blog field | Notes |
|---|---|---|
| `date` or H1 title | `pubDate` | Required |
| `# Title` | `title` | From first H1 |
| `excerpt` or `description` | `excerpt` | Optional |
| `image` | `image` | See preview image rule below. Use `./_assets/<filename>` path |

### Preview image rule

After extracting the H1 title, check if the **very next non-empty line** is a markdown image (`![...](...)` or `![[...]]`). If it is, use that as the `image` frontmatter field. **Keep the image in the body too** — it serves as the preview card thumbnail AND appears at the top of the post content. If anything else appears between the title and the image, set no `image` field.

```
# My Post Title        ← title
![alt](preview.jpg)   ← goes into frontmatter image AND stays in body
```

```
# My Post Title        ← title
Some intro text...     ← no image here → no `image` field
![alt](other.jpg)
```

Strip wikilinks from body content same as TILs.

---

## Deduplication

Before writing any file, check if it already exists at the destination path. If it does:
- Show Ross the diff between vault version and existing blog version
- Ask: overwrite, skip, or merge?

---

## After import

1. Run `pnpm lint` and `pnpm format:check` from the blog root
2. Fix any issues (usually just formatting)
3. Report a summary: how many files imported, skipped, and any items needing attention (missing covers, missing summaries, etc.)
4. Optionally run `pnpm dev` and suggest Ross preview the results
