

### Gate 5 — Lint / format
`uv run ruff check --fix` and `uv run ruff format cfc/fold/` — clean.

### Gate 6 — Self-review against team standards
Invoke the **`cardforcoin-code-review`** skill on your diff. Resolve every
`critical` and `major` finding. Note any deliberately deferred `minor` findings
in the PR with a reason.

### Gate 7 — Honesty gate (delivery)
- **All of Gates 0–6 green** → open the PR with the **QA Evidence** block below in
  the description.
- **Any gate failed or could-not-verify** → do **not** open a normal PR claiming
  done. Open a **draft** PR (or comment on the ticket) with a
  `⚠️ Could not verify` section stating exactly what is unverified, why, and the
  repro steps a human needs. Parking honestly beats a confident-but-wrong PR.
