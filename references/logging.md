# Logging

An optional, local log of what happened in conversations, so facts about change and decisions can be collected over time. Used by all three skills. Off until the user asks.

## Contents
1. When to log
2. Where the log lives
3. Entry format
4. Rules for what goes in
5. Turning interpretation into facts
6. If the file cannot be written
7. Reading the log back

## 1. When to log
- Only when the user asks ("log it", "add this to my log", "start a log"). One entry per request. Never log silently.
- If you can write files on the user's machine, end an answer with one line: "Say 'log it' to save this to your log."
- Draft the entry from the conversation, append it, and show the user exactly what was written. If they want a change, edit the entry.

## 2. Where the log lives
- Default: `~/socratic-log/YYYY-MM.md` (one file per month, newest entry at the bottom). On Windows that is `%USERPROFILE%\socratic-log\`.
- The user can name another folder. Use it for the rest of the session.
- The log stays on the user's machine. Never write it inside a git repository, a shared or synced team folder, or any place that is uploaded. If the chosen folder sits inside a repository, say so and ask for another.
- Tell the user once per session: the log should stay local and out of git.

## 3. Entry format
Append this block. Leave a field out rather than guess it.

```
## YYYY-MM-DD HH:MM · <topic or system> · <reply | check | conversation>
- Who: <role or team, not a name>
- Context: <meeting or channel, and the decision or topic, one line>
- Said: <what was claimed or decided; one short quote at most, work statements only>
- Evidence: <what was offered as support, or "none named">
- Asked: <the question the user asked or will ask>
- Answer: <what came back, or "open">
- Open: <what is still unanswered, and by when it was asked>
- My interpretation (optional): <the user's own reading, clearly labelled>
- Tags: <few neutral words: decision, claim, evidence, follow-up, blocked, info-request>
```

## 4. Rules for what goes in
- **Facts first.** Who said what, where, when. What was decided. What evidence was named. What was asked and what came back. Dates for requests and for answers.
- **Roles, not names.** Use a role or team ("product owner", "architecture board"). Use a name only if the user gives one and asks for it.
- **Work only.** Never record age, generation, health, family, private remarks, or anything about a person's character or motives.
- **Short quotes.** At most one sentence, from a work statement. Otherwise paraphrase.
- **Interpretation is labelled.** It lives in one optional field, in the user's words. It is not a fact and not a conclusion.
- **Fairness test.** Before writing, ask: could the colleague read this entry and recognise it as an accurate account of what was said? If not, rewrite it.
- **Not a dossier.** One entry covers one event. Do not build profiles of people across entries.

## 5. Turning interpretation into facts
Users often describe motives or traits. Keep what can be observed, and put the rest in the labelled field.

| The user says | Log as fact | Optional interpretation |
|---|---|---|
| "He is hiding the numbers." | "Asked for the Q3 figures on 12 Oct. No answer by 26 Oct." | "I suspect the figures are not ready." |
| "The old guard blocks every change." | "Proposal X was declined at the 20 Oct meeting. No reason named." | "Feels like a pattern." |
| "She lied in the meeting." | "She said the migration was approved. The ticket shows no approval." | (leave empty unless the user insists) |

Do not refuse to log because the user is frustrated. Log the observable part, and say in one line which part was left out and why.

## 6. If the file cannot be written
Some environments cannot write outside the open workspace. Then show the entry as a code block, say where it belongs, and tell the user they can paste it. In VS Code, adding the log folder to the workspace (File, Add Folder to Workspace) usually lets Copilot write there.

## 7. Reading the log back
When the user asks for a summary (for a manager, a retro, a decision): use only the entries, list facts with dates, group by topic, and keep the interpretation field out unless the user asks for it. Name roles, not people. Say how many entries the summary rests on.
