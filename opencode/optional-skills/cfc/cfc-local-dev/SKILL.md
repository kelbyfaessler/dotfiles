---
name: cfc-local-dev
description: Use ONLY when the user explicitly asks to use cfc-local, the external cardforcoin local harness, or isolated host-native cardforcoin development. Runs local services, Django commands, tests, migrations, and resets through cfc-local without adding repository configuration files.
---

# Cardforcoin local development

Use the external `cfc-local` harness from a cardforcoin checkout. Do not apply this skill merely because `CFC_DEV_MODE=local`; the repository's `AGENTS.md` defines the default `lmake` workflow.

## Source of truth

Read `~/.config/cardforcoin-local/README.md` before choosing a command. The README defines current commands, ports, state locations, and lifecycle behavior.

## Workflow

1. Use one dedicated, stable worktree for each ticket, task, or agent session. If the current checkout is already the task worktree, keep using it. Otherwise use `cfc-local worktree create <ticket> --slug <short-slug>` to create and set up the task worktree from the intended base. Do not move or copy uncommitted changes from another checkout. Ask before proceeding when the task depends on uncommitted changes elsewhere.
2. Confirm that the working directory belongs to the selected cardforcoin worktree.
3. Run `cfc-local setup` before the first harness command in that worktree. Repeating setup is safe.
4. Use the narrowest `cfc-local` command for the task.
5. Exercise changed backend behavior against `cfc-local api` or `cfc-local admin` when the cardforcoin definition of done applies.
6. Run affected tests with `cfc-local test args="<test labels and options>"`.
7. Check `git status --short` after the work. Harness state must remain outside the repository.
8. When removing the task worktree, stop its processes, run `cfc-local teardown` from inside it, and only then run `git worktree remove` from another checkout.

## Command rules

- Use `cfc-local test`, not `cfc-local manage command="test ..."`. The test command owns the shared test-database lock and preserves Django's exit code.
- Use `cfc-local migrations` only when the requested model change needs a repository migration.
- Use `cfc-local reset-test-db` only to discard the preserved test database.
- Use `cfc-local teardown` only when retiring the current task worktree. It destroys that checkout's local development and test data after validating ownership. Never remove the Git worktree first, and do not use teardown merely to stop services temporarily.
- Treat `cfc-local reset` as destructive. Run it only when the user requests fresh development data or the task requires a database rebuild.
- Start `cfc-local api`, `cfc-local admin`, `cfc-local celery`, and `cfc-local celery-beat` as background processes when later steps need the terminal.
- Use the URLs printed by `cfc-local status`. Do not assume that the standard Django ports apply.

## Safety boundaries

- Do not create local configuration files in the cardforcoin checkout. Generated configuration and runtime state belong under `~/.local/share/cardforcoin-local/`.
- Never read, copy, print, or modify `cfc/config/_local.yml`, another `*_local.yml`, `.env`, or credentials.
- Do not modify or remove a Docker container or volume that the harness rejects as unowned.
- Do not bypass the local test lock or remove it while a test or reset is active.
- Never bypass teardown ownership or active-process checks. Stop the reported checkout processes and retry.
- Keep benchmark work in the `cfc-benchmarks` skill.

## Failures

Fix the cause reported by `cfc-local`. Do not fall back to repository configuration changes, unscoped Docker cleanup, or a different database. If an external dependency prevents verification, report the blocked behavior under the cardforcoin definition-of-done rules.
