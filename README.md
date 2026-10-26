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

The canonical reference is `references/socratic-method.md` at the repo root. Edit only that file and run `scripts/sync-references.sh` to copy it into the three skills; the copies exist so each skill folder is self-contained.

## Install

**Claude Code, as a plugin**

```
/plugin marketplace add <owner>/socratic-skills
/plugin install socratic-skills
```

**Claude Code, one project**: copy the skill folders you want into `.claude/skills/` of that project.

**Claude (web, desktop, mobile)**: open a `SKILL.md` in this repo, or the `.skill` package from the latest release, and save it as a skill.

**No Claude at all**: read `skills/*/SKILL.md` and `references/socratic-method.md` as method cards. They work on paper too.

## Test cases

Each skill has `evals/` with realistic prompts and the assertions a good answer must meet. Run them with Claude Code:

```
cd skills/socratic-reply && claude plugin eval .
```

These are billed model runs. The assertions check the mechanical things (one question, no "but", the colleague's own words reused); the quality of the question remains a human judgment.

## Working here

- Rules: `CLAUDE.md`. Capture map: `docs/agents/capture.md`.
- Log a fact: `/capture <what happened>`.
