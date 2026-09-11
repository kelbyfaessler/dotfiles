---
name: cfc-benchmarks
description: Use when the user asks to run, compare, summarize, debug, or change cardforcoin Django test benchmarks, remote namespace benchmarks, or Django memory benchmarks through cfc-local. Preserves provenance, locks, historical artifacts, and repository cleanliness.
---

# Cardforcoin benchmarks

Run and analyze benchmarks through the external `cfc-local` tools. Do not add benchmark source, reports, results, locks, or generated configuration to a cardforcoin checkout.

## Source of truth

Read these files before running or changing a benchmark:

- `~/.config/cardforcoin-local/benchmarks/README.md` for commands and file locations.
- `~/.config/cardforcoin-local/README.md` for harness behavior.
- `~/.config/cardforcoin-local/benchmarks/docs/TEST_BENCHMARK_REPORT.md` when interpreting Django test measurements.

## Pick the benchmark

- Use `cfc-local benchmark` for phase-level Django test timing. Local mode is the default.
- Use `cfc-local benchmark --mode remote --namespace <name>` to measure a development namespace.
- Use `cfc-local benchmark-memory --image <image>` to compare host and container startup and memory use. Ask for the image if the user did not provide one.
- Use `cfc-local benchmark-summary` to compare saved Django test benchmark artifacts.

Use a descriptive `--batch-id` for measured runs. Keep warmups and measured repetitions in the same batch.

## Local benchmark workflow

1. Use one dedicated, stable benchmark worktree for the complete investigation. For a ticket-backed investigation, create it with `cfc-local worktree create <ticket> --slug <short-slug>`. Run baseline and comparison batches from the same absolute path so checkout-specific database state remains comparable.
2. Run `cfc-local setup` once in that worktree before measuring it.
3. Confirm that no test, server, worker, benchmark, or other material workload is active in any checkout. Worktree isolation prevents corruption, not host contention.
4. Run the selected scenario or test label.
5. Summarize the batch and report the saved artifact paths.
6. Keep the worktree until all before-and-after batches and canonical checks are complete. Then run `cfc-local teardown` from inside it before removing the Git worktree. Teardown preserves benchmark artifacts.

The benchmark and `cfc-local test` share `~/.local/share/cardforcoin-local/locks/test.lock`. Do not bypass or remove this lock.

## Remote benchmark workflow

1. Require an explicit development namespace.
2. Sync the checkout through the repository's normal remote development flow before measuring it.
3. Run the remote benchmark and let it pin a pod and verify every application `.py` file.
4. If source verification fails, sync or redeploy the namespace and retry. Never disable the check or copy application source into the pod by hand.
5. Summarize the batch and report the namespace, source provenance, duration, and artifact paths.
6. Confirm that ConfigMap `cfc-test-run-lock` ends with `expires_at=0`.

Remote benchmark clients coordinate through `cfc-test-run-lock`. Direct `make manage` and arbitrary `kubectl exec` commands do not acquire it. Do not start either while a remote benchmark is active.

## Results and comparisons

- Keep raw Django test results under `~/.local/share/cardforcoin-local/benchmarks/test-runs/`.
- Keep memory results under `~/.local/share/cardforcoin-local/benchmarks/django-memory/`.
- Preserve historical records unless the user explicitly requests deletion.
- Compare like with like: the same scenario, mode, application source, migration state, Python and Django versions, warmup policy, and repetition count.
- For local comparisons, also require the same absolute worktree path and checkout-specific test database. Do not compare a fresh disposable worktree with a warmed worktree.
- Report medians and dispersion from repeated measured runs. Do not draw a conclusion from one noisy run unless the user requested a smoke test.
- Treat failed runs and source mismatches as failures, not measurements.

## Changing benchmark code

Keep source and tests under `~/.config/cardforcoin-local/benchmarks/`. Run focused tests from the cardforcoin checkout so `uv` selects the project environment:

```shell
PYTHONPATH="$HOME/.config/cardforcoin-local:$PWD/cfc" uv run python -m unittest discover -s "$HOME/.config/cardforcoin-local/benchmarks/tests" -p 'test_*.py'
```

Run Ruff and formatting against the external benchmark paths with the cardforcoin checkout as the working directory. Exercise each changed execution mode against the real host, container, or remote namespace before reporting completion.

## Safety boundaries

- Do not write benchmark files into the cardforcoin repository.
- Do not delete or replace active lock state.
- Do not relabel stale pod source as local source.
- Do not expose credentials or read local secret configuration while collecting provenance.
- Do not claim a benchmark change is complete from unit tests alone. Observe the changed path and verify its saved artifact.
