---
description: Conduct a detailed interview about a specific feature or topic to gather information and create a specification.
disable-model-invocation: true
---

# Interview

$ARGUMENTS

## Phase 1: Context gathering

Before asking questions, explore relevant parts of the codebase to understand:
- Related existing features, models, and patterns
- Relevant domain concepts from docs/

## Phase 2: Interview

Use `AskUserQuestionTool` to conduct a free-form interview that starts as brainstorming and progressively converges toward an implementation plan.

**Approach:**
- Start from first principles—don't assume you understand the goal
- Challenge assumptions and probe for hidden complexity
- Ask about conflicts with existing features
- Explicitly clarify scope: what's in, what's explicitly out for later
- Explore edge cases, error states, permissions

**Cover these areas** (not necessarily in order):
- Core problem / why this feature
- Users and their goals
- Happy path and variations
- Edge cases and error handling
- Integration with existing features
- Data model implications
- UI/UX flow and states
- Constraints and non-negotiables

Continue asking questions until you have absolutely everything needed to write a complete implementation plan. Submit your decisions for validation as you go.

**Question rules:**
- Keep a saved list of every open question; add new ones as answers raise them.
- Infer nothing: anything the user or the material hasn't stated is a question, even a sensible default.
- Ask one question at a time, very summarised: one line of context, 2–4 options, the recommendation first. Wait for the answer before the next. Never batch.
- Write no plan until every question is answered.

## Phase 3: Plan

Write a plan including:

- **Summary**: One paragraph
- **Context**: Background information (why, goals, links to related issues or documentation)
- **Scope**: What's included / explicitly excluded
- **Product requirements**: UI/UX, user stories
- **Technical plan**: Architecture, data model, implementation details
- **TODOs**: Specific tasks to be done
- **Deferred**: Questions the user chose to leave for later

After the plan, state your confidence in it as a percentage with a one-line reason. Below 85%, ask the user whether to run another review pass.

The plan must be written in the same language as the user's input (e.g., if the user asked in French, write the plan in French).
