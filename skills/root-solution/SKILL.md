---
name: root-solution
description: Step back from a fix, plan or recommendation that keeps growing by additions. Trace the bad states it handles to the choice that produces them, check whether that choice can change, and propose the design in which those states do not occur, or confirm that the current solution holds. Use only when the user invokes it explicitly (/root-solution).
disable-model-invocation: true
argument-hint: "[what you are unhappy with]"
---

# Root solution

## Goal

The user suspects that the current work or recommendation handles problems one at a time: each bad state gets a guard, a retry, a fallback or a job, and the design only grows. Find the design in which those bad states do not occur. Deliver a solution the user can act on, not a critique of the current one. If the current solution is already that design, say so and say what it stands on. The user's doubt is a reason to check, not evidence.

## Target

The text after the skill name is the user's concern, in their words. The target is the fix, plan or recommendation it points to. With no text, take the latest recommendation or the work in progress in this conversation. Name the target in one line and go on; do not stop to ask.

## Method

1. **Write the goal without the current design, then list what was added.** One sentence: what must be true when the work is done, and for whom. Use no mechanism of the current solution in it. Take it from the user's words, not from your earlier plan. Then list the parts of the current solution in the order they were added, including those added in this conversation, one line each. Mark each part:
   - *goal*: it delivers the goal directly.
   - *handles*: it exists because of a bad state (a retry, fallback, guard, check, flag, lock, sync or repair job, special case, manual step, alert, escape hatch). Write the bad state and the evidence that it occurs: seen in data, logs or tests, or it follows from a verified fact. If there is none, write "no evidence".

2. **Trace each bad state to the choice that makes it possible.** Ask "what in the design lets this state occur?" until you reach something that was chosen: the order of steps, where a piece of state lives and how many copies exist, who owns it, a boundary between components, a definition, a requirement, a dependency. Bad states that lead to the same choice share a root. Expect one or two roots.

3. **Check each root: constraint or choice.** A constraint is what we cannot change: math, the actual behavior of an external system, law, measured data. Verify it first-hand (source, spec, test, raw data), with read-only actions or in a test environment. A document, memory, an earlier turn or "everyone does it" is a claim, not a constraint. A choice is what we or the user can change. If a root is a verified constraint, the parts that handle its bad states are required: keep them. If a root is the user's decision (product meaning, scope, money, anything irreversible), it can still change, but only as a proposal to the user. A design can also depend on a boundary that only the user can set and nobody has stated: a standing principle such as whether we may hold user funds, which data may leave a region, how stale a shown value may be, or which actions need a person. It is not a fact (find facts yourself) and not a taste between options that all fit the constraints. Look for it in documents and earlier decisions first; if it is not there, do not pick a value silently.

4. **Design from the root.** For each root that can change, go down this list and take the first item that meets the goal and every verified constraint:
   1. Remove the need. Does the goal need this step, state or feature at all?
   2. Change the choice so the bad state cannot occur: reorder the steps, keep one copy of the state, move the decision to where the information is, narrow a definition so the bad value cannot be written.
   3. Use a path that already has proof: one with a working example in production, or a feature of the platform or standard library.
   4. Keep the choice and handle the bad state.

   Change the root and what depends on it, nothing more; a wider redesign is another way of adding. Write the resulting design as a whole, not as a diff. Remove parts that handle a bad state with no evidence, and list those states under risks. Add no part for a worry without evidence, including alerts, reconciliation or a second safeguard.

5. **Compare end states and close.** Judge by the system that remains, not by the size of the change: a patch is always the smaller change. For the current design and the new one, count the parts, the bad states that can still occur, and the things that must be kept in agreement. Mark the parts of the new design as in step 1; if it needs handling parts of its own, count them. Then:
   - The new design removes at least one part or one bad state with evidence, and that gain is worth the cost and risk of switching: recommend it.
   - Otherwise: recommend keeping the current solution. Do not invent a design to look constructive.
   - A root's status is unknown and it decides the answer: run the cheapest safe check now. If you cannot, give the design for each outcome and say who can check.
   - An unstated boundary from step 3 decides the answer: give the design under the answer you recommend, and ask about the boundary in the output. Do not stop before giving the design.

## Output

In the user's language. One screen, solution first. Leave out empty items.

1. Verdict, one line: "Change to …", "Keep the current solution", or "Depends on …".
2. Root: the choice that produces the bad states, and the evidence that it can change, or the constraint that fixes it.
3. Design: what to do, as a whole. Removed parts, one per line: part · the bad state it handled · why that state no longer occurs. Handling that stays: part · the constraint that requires it. A one-time cleanup for bad states that already exist, if any.
4. Next: the first step; what is reversible; the cheapest check that could prove the design wrong, with its result if you could run it safely.
5. Stands on: one to three premises that would overturn the verdict if false, each with its evidence, or "not checked" and what would settle it.
6. Ask the owner: at most three unstated boundaries whose answer changes the verdict, one per line: the question, worded so that "yes" accepts your recommended answer · what changes under the other answer. Suggest recording the answers where later decisions will read them. Never ask for a fact or a taste.
7. Gives up and risks: what the new design loses, the cost of switching, worries without evidence.

Do not write a list of "could also add".

## Boundaries

- Do not edit code, documents or decisions under this skill. Hand the design to the user; work resumes when they accept it. This is an instruction, not a permission setting.
- Do not run anything that writes to production systems or data, moves real money, uses production credentials, deploys, or sends messages to real people. Mark such a check "not checked".
- This skill checks only the roots. If the question is whether a settled decision, spec or claim is true, or a root rests on a chain of claims that each need evidence, say so and suggest `/premise-challenge <target>`. Do not reproduce its method here.
- If the user calls this skill again on the same target and brings no new fact or direction, do not rerun the steps: your view from inside this conversation has not moved. Say so, and suggest an independent pass: the cold-start step of `/premise-challenge`, or a new session given only the goal, the verified constraints and the bad states with evidence.
