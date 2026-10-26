# socratic-skills

Three Claude skills for asking better questions at work, distilled from Elke Wiss, *Socrates op sneakers. Filosofische gids voor het stellen van goede vragen* (Ambo|Anthos, 2020). The book is the source; buy it, it is short and good. This repo holds no text from the book, only the method as working instructions.

Each skill answers in the language of the message you paste (Dutch, English, anything else).

## The three skills, in the order you'll usually need them

| # | Skill | Use it when | You get |
|---|---|---|---|
| 1 | `socratic-reply` | A colleague said or wrote something and you want to respond with a question that makes them think, not with advice or your opinion. | A two-line analysis, one question ready to send, two alternatives, and the reflex to hold. |
| 2 | `socratic-question-check` | You drafted a question, a message, or a list of retro/interview/1:1 questions and want to know whether it is a real question or a disguised opinion, reproach or cocktail. | Verdict, pitfalls by name, a rewritten version, and a plain-statement alternative when you actually want to say something. |
| 3 | `socratic-conversation` | You prepare or debrief a longer conversation: a 1:1, a disagreement, a decision, a retro you want to lead differently. | A one-minute plan: permission line, fact questions, hot spot, questions up, confront/suppose-that options, bridge to your own view, what to watch for. |

Most days you only need #1. Run #2 on anything with stakes. Use #3 when one question is not enough.

## How it works

Each skill folder has a short `SKILL.md` (the procedure, an example, the output format) and a copy of `references/socratic-method.md` (the method itself: attitude, listening positions, questions down and up, hot spot, the pitfall catalogue, open/closed/why, probing, confronting, elenchus and aporia, consensus and the bridge, glossary of the Dutch terms). The skill tells Claude which section to read when.

The canonical references are the files in `references/` at the repo root: `socratic-method.md` (the method) and `logging.md` (the optional log). Edit only those and run `scripts/sync-references.sh` to copy them into the three skills; the copies exist so each skill folder is self-contained.

## Install

**GitHub Copilot in VS Code (agent mode)**

Copilot reads the same `SKILL.md` format. Personal skills live in `~/.copilot/skills/`, project skills in `.github/skills/`.

- Windows: `powershell -ExecutionPolicy Bypass -File scripts\install-copilot.ps1`
- macOS / Linux: `scripts/install-copilot.sh`
- By hand: copy the three folders from `skills/` (or unzip the `dist/*.skill` files) into `~/.copilot/skills/` (`%USERPROFILE%\.copilot\skills\` on Windows).

Then in Copilot chat use `/socratic-reply`, `/socratic-question-check` or `/socratic-conversation`, or describe the task and let Copilot pick the skill. If a skill does not show up, run `scripts/validate-skills.sh`: Copilot ignores a skill silently when its name does not match its folder.

Not yet verified inside Copilot itself. Your organisation can also switch agent skills off.

**Claude Code, as a plugin**

```
/plugin marketplace add <owner>/socratic-skills
/plugin install socratic-skills
```

**Claude Code, one project**: copy the skill folders you want into `.claude/skills/` of that project.

**Claude (web, desktop, mobile)**: upload the ready-made packages from `dist/` (`socratic-reply.skill`, `socratic-question-check.skill`, `socratic-conversation.skill`) as skills. Each package holds the skill and its references.

**No Claude at all**: read `skills/*/SKILL.md` and `references/socratic-method.md` as method cards. They work on paper too.

## Log (optional, local, facts only)

Say "log it" after an answer and the skill appends one entry to a local Markdown file, `~/socratic-log/YYYY-MM.md` by default. Over time it becomes a dated record of what was said, which evidence was named, what was asked and what is still open. That is the kind of material managers can act on.

How it stays fair and safe:
- Off until you ask. One entry per request, shown to you as written.
- Local only. Never inside a git repository or a shared folder. `.gitignore` here blocks the usual names as a second guard.
- Facts first. Roles, not names. Never age, generation, character or motives. Your own reading goes in one labelled field.
- Fairness test: could the colleague read the entry and recognise it as accurate?

Details and the entry format: `references/logging.md`.

Before you use it on a work laptop, check your organisation's policy. Notes about identifiable colleagues are personal data, and colleagues may be entitled to see them.

In VS Code, add the log folder to the workspace (File, Add Folder to Workspace) so Copilot can write to it. If it cannot, the skill shows the entry for you to paste.

## Test cases

Each skill has `evals/` with realistic prompts and the assertions a good answer must meet. Run them with Claude Code:

```
cd skills/socratic-reply && claude plugin eval .
```

These are billed model runs. For a free structural check (names, descriptions, links, synced references) run `scripts/validate-skills.sh`. The assertions check the mechanical things (one question, no "but", the colleague's own words reused); the quality of the question remains a human judgment.

## Working here

- After changing a file in `references/` or a `SKILL.md`: `scripts/sync-references.sh`, then `python3 scripts/package_skills.py`, then commit `dist/`. `scripts/validate-skills.sh` fails when `dist/` is out of date.

- Rules: `CLAUDE.md`. Capture map: `docs/agents/capture.md`.
- Log a fact: `/capture <what happened>`.
