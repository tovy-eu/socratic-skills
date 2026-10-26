---
name: socratic-question-check
description: Audit a question or message the user drafted for colleagues and rewrite it so it is a real, open, self-contained question instead of a disguised opinion, reproach or cocktail of questions. Use this whenever the user shares a draft question, chat message, mail, feedback request, or a list of retro, interview, survey or 1:1 questions and asks whether it is good, neutral, open, non-leading, or how to phrase it better. Also use it when the user asks "is this a loaded question", "does this sound passive-aggressive", or wants to check their questions before a meeting. Based on Elke Wiss, Socrates op sneakers.
---

# Socratic question check

Goal: catch the pitfalls that turn a question into a reproach, a hidden opinion or noise, and hand back a version that is a real question. Works on a single question or a whole list.

This is step 2 of a set of three. `socratic-reply` writes a question from a colleague's message; `socratic-conversation` prepares a whole conversation. The full pitfall catalogue, the open/closed rule and the "why" leaflet are in [references/socratic-method.md](references/socratic-method.md), sections 8 and 9. Read them before auditing; they are short.

## Input
A draft: one question, a message, or a list. Optional: audience and purpose. Answer in the draft's language. Short sentences. No praise, no padding; if the draft is already clean, say so in one line and stop.

## Steps

1. **Purpose.** Silently: fact-check, deepen, confront, challenge, decide? If there is no visible purpose, say so; a question without purpose is noise. If the purpose is to *say* something, the fix is a statement, not a better question.

2. **Is it a question at all?** A question invites thinking and stays with the other's story. Verb-first ("Don't you think...", "Isn't it so that...") is usually a hypothesis check or a disguised opinion; article-first ("The reports were...?") is rhetorical. Words like *surely, also, of course, not...then* mark a hidden opinion.

3. **Run the pitfall catalogue** (reference section 8). Name every hit with the exact words that trigger it: disguised statement, comma-idiot question, but-question, cocktail question, vague question, false either/or, not self-contained, too long an introduction, why-as-punishment, hidden advice, own experience, paraphrase instead of the other's words, hypothesis check, interpretation stated as fact. Also list leaking small words (*but, then, not yet, just, always, all, again, actually*).

4. **Classify.** Open or closed, judged by the first word, not by the expected answer. Down (facts) or up (arguments, norms). Closed is fine for a check, for structuring a rambling story, or for forcing a position; flag it only when it will block a reluctant colleague. For a list: are the questions ordered down → up? Flag a jump to abstractions before the concrete case is clear.

5. **Rewrite.** One question per message or turn. Short. Self-contained. The colleague's own words where known. If the user holds an opinion, state it separately and honestly ("I think X. How do you see it?") rather than loading the question. If the draft was a reproach, also give the plain-statement version: "I'm annoyed the report isn't there yet. What happened?"

## Output

```
**Verdict** – one line: real question / hidden statement / mixed.
**Pitfalls** – one bullet per hit: name · the exact words · what it leaks.
**Rewritten** – ready to send. One question; for a list, the sequence in intended order (down first).
**If you actually want to say something** – one-line statement version (only when relevant).
```

## Example

Input: *"Maar heb je nog niet gekeken of we dit gewoon in dbt kunnen doen in plaats van weer een losse notebook?"*

**Verdict** – Hidden statement.

**Pitfalls**
- But-question · "Maar" · you already have an opinion.
- Comma-idiot question · "nog niet gekeken" · reads as "you should have looked, idiot".
- Hidden advice · "gewoon in dbt" · the solution is in the question.
- Leaking words · "gewoon", "weer" · this is a pattern that annoys you.
- Closed, verb-first · "heb je" · a check, but used to steer.

**Rewritten** – "Wat maakte dat je voor een notebook koos in plaats van dbt?"

**If you actually want to say something** – "Ik zou dit liever in dbt zien dan in een losse notebook. Wat was je reden voor de notebook?"

## Quick reference
Open = who, what, where, which, when, how, what for. Closed = begins with a verb; use for check, structure, forcing a position.
Why-alternatives: "What is the reason that...", "What made you...", "How come...", "How did you arrive at...".
Up: "What does this have to do with X?", "Is someone who does X automatically Y?" Down: "What did he say exactly?", "Who was there?", "What happened next?"

## Log (only on request)
When the user says "log it" or asks to keep a log, read [references/logging.md](references/logging.md) and append one entry to their local log: facts first, roles not names, interpretation only in its labelled field. Never log unasked. If you can write files here, end your answer with one line: "Say 'log it' to save this to your log."
