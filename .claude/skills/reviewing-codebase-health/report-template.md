# Step report template

Write each step's report in chat in this order. Skip a heading only when it would be empty. Reference code as `file_path:line`.

```markdown
## Step N report: <topic>

<One or two sentences: overall verdict and what was measured.>

### What's already good
- Evidence-backed bullets (what you checked and found clean).

### Should-fix
**1. <Finding>.** What is wrong, where (`path:line`), what it costs, the fix.

### Consider (cheap, lower value)
- ...

### Decisions for you
**A. <Question>?** Options, cost of each, "My lean: ...".

### Deferred to later steps
- Item, and which step owns it.

### Leave as-is
- Thing that looks suspicious but is fine, and why.

### Proposed plan
**Do now:** <items needing no decision>.
**Your call:** <items waiting on Decisions>.
```

Rules for the content:
- Every finding cites a measurement or a file reference, not an impression.
- Rank by severity; do not pad. A clean area is a short report.
- Recommendations come with a lean, so a decision costs one word to answer.
- Items the user already decided (see the review log) do not reappear unless the facts changed; if so, say what changed.
- Styling or look-and-feel findings end with a short checklist for the user to verify in the browser.

## After-implementation summary

Close each step with: a table of commits (hash, what, how verified), the check results (`validate` exit status, test count, type errors), anything surprising, a visual checklist if styling changed, and the name of the next step.
