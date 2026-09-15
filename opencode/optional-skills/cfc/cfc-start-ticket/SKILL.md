---
name: cfc-start-ticket
description: Use when starting a cardforcoin Linear ticket such as BE-1234. Reads the issue, creates its local worktree and branch, researches the code, and produces an implementation plan for human review.
---

# Start a cardforcoin ticket

Prepare a Linear ticket for implementation in an isolated local worktree. Stop after presenting the implementation plan. Do not implement the ticket until the user approves the plan.

## Input

Require one Linear issue identifier such as `BE-1234`. If the identifier is missing or ambiguous, ask for it before running commands.

## Workflow

1. Load the `cfc-local-dev` skill.
2. Read the issue with `linear_get_issue`, including relations and customer needs. Read all issue comments with `linear_list_comments`. Extract embedded images when the description or comments contain screenshots or diagrams.
3. Restate the issue as observable acceptance criteria. Separate explicit requirements from assumptions and unresolved questions.
4. Create a short slug from the issue title. Use one to three meaningful lowercase words joined by single hyphens. Keep it under 25 characters. Omit the ticket identifier, filler words, and implementation details. For example, shorten "Prevent duplicate card activation notifications" to `dedupe-activation-alerts`.
5. From an existing cardforcoin checkout, run `cfc-local worktree create <ticket> --slug <slug>`. Do not create the branch or directory with separate Git commands. The command creates `~/work/cardforcoin-worktrees/<ticket>`, creates the branch from local `develop`, and runs setup. Branch names start with the uppercase ticket identifier, for example `BE-2736-xyz`.
6. If creation or setup fails, report the exact failure and the worktree path. Do not implement the ticket or remove a partially created worktree automatically.
7. Inspect the new worktree, its `AGENTS.md`, the issue's relevant routes, services, DAL, models, tests, migrations, configuration, and recent related changes. Check both `api/routes/` and `api/ninja/` for API work. Use code references from the new worktree, not the checkout that launched the command.
8. Identify the current behavior and the smallest coherent change that meets the acceptance criteria. Call out data migrations, compatibility requirements, external dependencies, rollout risks, and behavior that cannot be verified locally.
9. Present the implementation plan for human review. Do not edit application code, change the Linear issue, create comments, commit, or open a pull request.

## Planning and implementation conventions

- Find the closest existing implementation and use its naming, layering, contracts, and validation as the default.
- Keep API-call helpers simple: accept plain values, return raw responses, and let required-field access fail naturally. Put domain interpretation and recovery above them.
- Separate pre-existing concerns from newly introduced risks; keep unrelated hardening out of the diff, but bring up those concerns for human review.

## Plan format

Use these sections:

- **Ticket**: identifier, title, Linear URL, worktree path, and branch.
- **Acceptance criteria**: observable pass or fail behaviors.
- **Current behavior**: relevant code paths and what they do now, with file and symbol references.
- **Implementation**: ordered changes by architecture layer. Name the files and symbols likely to change.
- **Tests and QA**: regression tests, canonical test commands, and the running-backend behavior to exercise.
- **Risks and questions**: unresolved decisions, dependencies, compatibility concerns, verification limits, and pre-existing concerns deferred for human review.

End with a direct request for plan approval. Keep the plan specific enough that another engineer can implement it without repeating the investigation.
