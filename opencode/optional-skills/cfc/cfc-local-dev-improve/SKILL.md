---
name: cfc-local-dev-improve
description: Use when the user asks to continue a numbered cardforcoin local development improvement priority, revise the local dev improvement plan or priorities, or use benchmark evidence to improve the cfc-local workflow.
---

# Cardforcoin local development improvements

Coordinate work on the external `cfc-local` improvement plan. Use `cfc-local-dev` and `cfc-benchmarks` for execution rather than repeating their instructions here.

## Restore context

Read `~/.config/cardforcoin-local/benchmarks/docs/DEVELOPMENT_ITERATION_RECOMMENDATIONS.md` first. Treat its current text, not a remembered priority number or this skill, as the source of truth for scope, priority order, completed work, rollout, and benchmarking policy.

Then read only the sources needed for the request:

- `~/.config/cardforcoin-local/benchmarks/docs/TEST_BENCHMARK_REPORT.md` for published measurements, methodology, limitations, and benchmark scenarios.
- `~/.config/cardforcoin-local/benchmarks/docs/LOCAL_DEVELOPMENT_EXECUTION_MODEL.md` for the host-native Django decision and worktree isolation model.
- `~/.config/cardforcoin-local/benchmarks/README.md` for the maintained and generated file inventory.
- `~/.config/cardforcoin-local/README.md` for current harness behavior and commands.
- `~/.config/cardforcoin-local/benchmarks/docs/REMOTE_DEVELOPMENT_AND_CI_RECOMMENDATIONS.md` only when separating deferred remote or CI work from the local plan.

Raw Django test results live under `~/.local/share/cardforcoin-local/benchmarks/test-runs/`. Memory results live under `~/.local/share/cardforcoin-local/benchmarks/django-memory/`. Use raw artifacts when the published report or benchmark summary does not answer the question. Preserve them as historical records.

## Related skills

- Load `cfc-benchmarks` before running, comparing, summarizing, debugging, or changing a benchmark. Follow its provenance, locking, artifact, and verification rules.
- Load `cfc-local-dev` before using the harness for services, Django commands, tests, migrations, resets, or end-to-end verification.

## Continue a priority

When the user refers to `priority N`, resolve that heading from the current improvement plan before acting. Find the current state in the plan, report, generated artifacts, and relevant source. Do not restart completed foundation work or assume that an old result is the current baseline.

For implementation work:

1. Use one dedicated, stable improvement worktree for the task. For ticket-backed work, create it with `cfc-local worktree create <ticket> --slug <short-slug>`. Keep its absolute path through baseline, implementation, comparison, and canonical verification.
2. Define the smallest remaining result that advances the priority.
3. Record or identify a valid baseline before changing behavior.
4. Make one conceptual change at a time.
5. Repeat the same benchmark after a performance-related change.
6. Run the canonical checks-enabled tests and exercise the real local path.
7. Update the plan or report when the evidence, status, or next work changes.
8. After all evidence and documentation are complete, run `cfc-local teardown` from the improvement worktree before removing it.

Keep before and after runs identical in absolute worktree path, checkout-specific test database, scenario, flags, source state, migration state, runtime, warm-up policy, and repetition count. Do not run material workloads in other worktrees during measured batches. Follow the plan's current significance rule. Treat noisy or incomparable results as inconclusive, not as improvements.

## Revise the plan

Keep `DEVELOPMENT_ITERATION_RECOMMENDATIONS.md` focused on actionable local iteration work. When changing it:

- Reconcile `Current evidence`, `Completed foundation`, `Priorities`, `Rollout`, `Benchmarking policy`, and `Relevant files` so they do not contradict each other.
- Support priority changes with measured evidence, a discovered dependency, or a concrete defect.
- Mark completed outcomes as foundation instead of leaving them phrased as future work.
- Keep unmeasured ideas as investigations, not conclusions.
- Move remote development, Kubernetes, and CI proposals to `REMOTE_DEVELOPMENT_AND_CI_RECOMMENDATIONS.md` unless local work depends on them.
- Preserve historical findings in the benchmark report. Add new dated evidence instead of rewriting old measurements to match the current environment.
- Keep generated results out of both the cardforcoin checkout and `~/.config/cardforcoin-local`.

## Main implementation files

The improvement plan lists the relevant files for each priority. Common external files are:

- `~/.config/cardforcoin-local/bin/cfc_local.py` for harness orchestration.
- `~/.config/cardforcoin-local/bin/django_test.py` for normal local test execution.
- `~/.config/cardforcoin-local/cfc_local_test_settings.py` and `cfc_local_server_settings.py` for generated-settings behavior.
- `~/.config/cardforcoin-local/benchmarks/test_benchmark.py` for benchmark orchestration and artifacts.
- `~/.config/cardforcoin-local/benchmarks/benchmark_tests.py` for the benchmark entry point.
- `~/.config/cardforcoin-local/benchmarks/benchmark_runner.py` for phase instrumentation.
- `~/.config/cardforcoin-local/benchmarks/django_memory_benchmark.py` for host and container startup and memory measurements.
- `~/.config/cardforcoin-local/tests/` and `~/.config/cardforcoin-local/benchmarks/tests/` for harness and benchmark tests.

Application import, settings, URL, admin, factory, and transaction-test work belongs in the dedicated improvement worktree. Use the exact paths listed by the current priority and inspect that worktree before editing.

## Boundaries

- Optimize the local feedback loop, not production similarity. Keep remote development and staging as environment-fidelity checks.
- Keep each test invocation in a fresh Python process unless new evidence changes the execution-model decision.
- Preserve PostgreSQL semantics, per-worktree data isolation, the shared local test lock, generated configuration boundaries, and on-demand Django processes.
- Do not weaken canonical tests or checks to make a benchmark faster.
- Do not create tracked cardforcoin configuration or put harness code, benchmark code, reports, or generated artifacts in the cardforcoin repository.
- Do not expose or inspect local secrets while collecting configuration or source provenance.
