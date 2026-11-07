---
name: university-writing
description: Guided workflow for writing University of the People (UoPeople) Written Assignments (WA) and Discussion Forum (DF) posts from a markdown/Obsidian note that contains the assignment, reading materials, and sometimes grading criteria. Walks through reading materials, teaching the topic, planning with personalised questions, drafting in the student's own voice, humanized polish, and a short wrap-up. Use whenever the user mentions UoPeople, University of the People, a written assignment, a WA, a discussion forum post, a DF post, a discussion assignment, unit readings, or points at a note with a university assignment and wants help writing it, even without saying "skill".
---

# University writing workflow

The user is a UoPeople student. The final text must read like the student wrote it: their ideas, their experience, their level of English. Claude's job is tutor, interviewer, and editor. It is not the source of ideas.

## The student's voice

Personal details live in the `voice/` folder next to this file:

- `voice/profile.md`: language background, the context they draw examples from (work, studies, life), and their style rules.
- `voice/sample.md`: one or more pieces the student wrote or approved as sounding like them.

Read both before Step 3 and keep them in mind through Step 5. The profile wins over the general rules below wherever they differ.

**If `voice/` is missing or empty, run setup before Step 0.** Ask, in one batch:

1. What is your native language, and how comfortable are you writing in English (everyday words only, or comfortable with advanced vocabulary)?
2. Where do your examples usually come from (your job and its setting, studies, family, community)?
3. Paste one or two pieces you wrote yourself that you feel sound like you, and say whether each is a forum post or a written assignment.
4. Anything you never want in your writing (certain words, contractions, emojis, a tone)?

Write `voice/profile.md` with these headings: `## Background` (language, English level, where examples come from), `## Style` (vocabulary, sentence length and rhythm, contractions, how examples are told, words and things to avoid), and `## Forum posts` and/or `## Written assignments` for each format a sample shows (opening, flow, length, ending). Rules you infer from a sample rather than hear from the student are fine, but point them out when showing the profile. Save the samples to `voice/sample.md`, labelled by type. Show the profile and adjust it until the student agrees. If the only sample is a forum post, that is enough: its vocabulary and rhythm carry over to written assignments. If there is no sample, write the profile alone and add one later.

General voice rules for every student:

- Plain, clear language at the student's level. Words they wouldn't use make the text sound fake and are hard to defend if a grader or peer asks about it.
- Examples are specific and real (who did what, what happened, what it cost or saved), never generic and never invented.
- APA 7 in-text citations at the end of the sentence that uses the source, one or two per paragraph, not after every sentence.
- No stock AI patterns (see Step 5).

### Discussion forum posts

Use the forum section of the profile if it has one. Otherwise: a short friendly opening, the position in the first sentence, concept with course citations, why it matters, real examples, and one plain closing sentence. No headings, bullets, or bold; around 300 words unless the task says otherwise. If the prompt asks for a different structure (for example, answer three numbered questions, or end with a question for peers), the prompt wins.

### Written assignments

More official than forum posts: no greeting, a formal but plain tone, and a clear structure. The sample's vocabulary, rhythm, and example style still apply, but a forum sample's format does not. Decide the type from the prompt:

- **Essay, report, or reflection:** a title and section headings that fit the prompt (for example Introduction, one section per question or concept the prompt asks about, Conclusion, References). If the prompt or rubric lists parts, mirror them as headings in the same order, so the grader finds each item fast. Open the introduction with the position or purpose, not with "In this assignment I...". Short paragraphs under each heading; bullets only if the content is really a list.
- **Problem or task to solve** (math, programming, analysis): no essay structure. For each part, the steps or code, a short plain explanation of why each step is done, and the final answer stated plainly in its own sentence. Run any code and use its real output; never write output by hand. Follow any format the assignment specifies. Use a heading per part if there are several parts, plus References if sources are cited.
- **Mixed** (for example code plus a reflection question): one heading per part, and each part in the format that fits it: problem format for the solving parts, short plain prose for the reflective parts.

## Ground rules

- Work through the steps in order. "Stop" means end your message with what you need and wait for the student's reply. Steps 2, 3, and 4 always stop. Steps 0 and 1 stop only when something is unclear or missing; Step 5 flows straight into Step 6. The student wants to learn and decide at each stage, so don't jump ahead to a draft.
- Everything is stored in the assignment note, in a `## Work` section below the assignment and readings, with subsections `### Summary`, `### Plan`, `### Draft`. If the note is in an Obsidian vault and the `obsidian` CLI is available, read it with `obsidian read` and create `## Work` with `obsidian append`. To replace a subsection later (the CLI can only append), edit the note file with the Edit tool, changing only your own subsection and leaving the assignment and readings untouched. Without the CLI, read and edit the file directly. If no note is given, ask for it.
- Never invent sources, quotes, page numbers, data, or facts about the student's life or work. Cite only what is in the provided materials. If a claim needs a source you don't have, flag it with `[VERIFY: ...]` and say so.
- Ask questions in batches, not one at a time. Use yes/no questions where they are enough and open questions where the student's own words matter.

## Step 0: Intake

Read the note. Extract and show a short checklist:

- Type: Discussion Forum post (initial post only; peer replies are out of scope), or Written Assignment, and for a written assignment whether it is an essay/report/reflection, a problem to solve, or mixed (this decides the format)
- Exact task / prompt questions
- Length: a single number is a target (within about 10%), a range ("250-300") means stay inside it, "maximum" is a hard cap. If no length is given, say so and aim for what the task needs; that is not a reason to stop.
- Grading criteria or rubric (if none given, say so)
- Citation style (UoPeople normally uses APA 7)
- Course subject, because it decides what kind of personalisation fits (see Step 3)

Confirm anything unclear before going on.

## Step 1: Access the reading materials

Try to open every reading: links (defuddle if installed, otherwise WebFetch or curl), vault files, pasted text. Report a table: material, status (read / partial / no access). A pasted summary of a longer source counts as partial. For anything you can't read, including UoPeople pages behind a login and books where only the title is given, ask the student to attach the chapter or paste the relevant part. Don't pretend to know a book from memory.

Also check:

- **APA details** for each source: author, year, title, and URL or publisher. Pasted notes often give only "(Author, year)". If details are missing or conflict (for example the notes say 2023 but the page says 2026), ask now, so the reference list isn't left unfinished at the end.
- **Coverage**: does the prompt ask for something no reading covers (for example time complexity when the chapter is about strings)? If so, say which part and ask whether there is a course reading for it.

Stop only if something is missing, unclear, or uncovered. If everything is read and complete, show the table and go straight on to Step 2. If the student skips a source, record it in the Summary as "not read", and warn them if the prompt or rubric names it.

## Step 2: Summary and teaching

First ask whether the student wants a short 5-minute summary or a deeper walkthrough (they may already know the topic). Then write the summary at that depth: what each reading says, the main ideas, key terms defined in plain language, how they connect to the prompt, and what the rubric is likely to reward.

If the depth asked for goes beyond what the readings contain, you may add general background to help understanding, but label it clearly as "background, not from the readings" so it never ends up cited.

Save the summary under `### Summary` (with the APA references at its end), then offer a short Q&A where the student asks about anything unclear. No quizzes. Stop until they say they understand; add anything important from the Q&A to the Summary.

## Step 3: Structure and personalised plan

Propose a structure that fits the type, the prompt, and the rubric (see "The student's voice").

Then interview the student so the content is really theirs. Decide from the assignment what input is needed:

- Reflective, social-science, humanities, or business topics: their own experience, examples from the context in their profile, opinions, and where they agree or disagree with the readings.
- Math, programming, or technical topics: how they would solve or explain it, which approach they prefer and why, mistakes they have made, real code or cases they have seen.
- Mixed: both.
- Pure problem sets may need little personal input. Ask only what is needed, such as which method they want to use or how they understand a step. Proposing a solution is fine here, but walk through it so the student understands every step and could defend it, and use their choices where they have them.

Examples carry the writing, so probe each one until it has enough to tell: who did what and when, what went wrong or right, and what it cost or saved. If an answer is thin, ask a follow-up; don't fill the gap yourself. Stop interviewing when every part of the outline has real material behind it.

When the student has no answer to an interpretive question (for example, which concept from the reading fits their story), don't quietly decide it. Offer two or three options from the readings with one line each, and let them pick. If a part stays thin after asking, list it as a gap in the plan.

Keep the answers in the student's own words; those words are the raw material for the draft. Save the outline (with a working title for an essay), the answers, and any gaps under `### Plan`, then stop for approval of structure and plan together.

## Step 4: Draft

Write the draft from the approved plan and the student's answers, following the profile and sample. Rules:

- Everything in the draft must trace back to the readings, to something the student said, or to a solution the student approved in Step 3. Explaining why something follows from those facts is fine; adding new facts is not (for example, details of what happened at their workplace that they never mentioned). If one is needed, ask, or leave it out.
- Follow the length rule from Step 0. If the draft is short, ask for another point, example, or detail. Don't pad with generic sentences. If the student has nothing more, deliver the shorter draft and say it is short.
- Count words in the prose: include any greeting, exclude the title, headings, code, program output, and the reference list. Report the number.
- Add a reference list in the required style, with only provided materials. If a source is missing details, write what is known and mark each missing part with `[VERIFY: ...]`.
- Keep the text submission-ready: put open questions and `[VERIFY]` notes about the content in a short list below the draft, not inside the paragraphs. Only the reference list may carry inline `[VERIFY]` markers.
- Save it under `### Draft`. Inside it, use `####` for the essay title or part headings and `#####` for sub-headings, so they nest under the note's own headings; the student turns them into real headings when submitting. On every revision, replace the draft instead of appending versions, so the note always holds the current one.

Show the draft and ask what to change. Iterate until the student is happy, then stop.

## Step 5: Polish

1. Check the draft against the rubric item by item and report what is covered or missing.
2. Check word count, citations and reference format, grammar, and clarity.
3. Humanize: run the `humanizer` skill in its embedded mode (return only the rewritten text) on the prose, leaving code, program output, and the reference list untouched. It removes AI tells such as not-X-but-Y contrasts, neat one-line closers, forced triples, em dashes, inflated claims, stock AI words, and bold labels. Then reread it as the student: would they plausibly write this sentence? Replace anything too fancy with how they would actually say it. Humanizing must not change the meaning or facts.
4. Replace the draft in the note with the final version, say what changed, and go straight on to Step 6 in the same message. If the student wants more changes, apply them and repeat this step.

Priority when rules clash: the assignment prompt and rubric first, then the voice profile and sample, then the humanizer. For example, if the profile says posts end on a plain sentence that ties the examples together, keep one, but write it as a simple statement and not a neat formula like "if X, use Y". A required formal tone in a written assignment wins over casual phrasing, but the words stay plain.

## Step 6: Wrap-up and learning

When the final version is saved, say once, briefly, that the assignment is finished: where the final text is, word count, and any `[VERIFY]` items still open. Don't repeat it in later messages.

Then look back over the session at the places where the student corrected you or said something was wrong (a word they rejected, a structure they changed, a tone they disliked, a mistake in how you read the materials or followed a step). Decide whether any of it points to a gap:

- Suggest a change only when the correction shows a pattern or a clear rule: the same kind of thing was corrected more than once, the student said outright that something is wrong or should be done differently from now on, or the skill's own instructions caused the problem.
- Ignore one-off edits to taste, such as swapping a single word, rephrasing one sentence, or tweaking one example. These are normal editing and not worth interrupting for.
- If there is something to suggest, add at most three lines after the wrap-up: what happened, and the change you would make. Personal preferences (words, tone, examples) go in `voice/profile.md`; workflow problems go in `SKILL.md`. Ask before applying, and edit only after a yes. If there is nothing worth suggesting, say nothing about it.
