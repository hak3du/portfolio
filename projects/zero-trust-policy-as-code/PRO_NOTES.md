# Professional Engineering Notes — Zero Trust Policy-as-Code

This is the project record. Keep it factual, dated, and reproducible. Every entry should distinguish **implemented**, **tested**, **observed**, and **still unverified**. Add test output, tool versions, commit SHAs, design decisions, failures, fixes, and evidence links as the work progresses.

## Project control

- **Project:** Terraform + OPA/Rego Zero Trust Infrastructure Guardrails
- **Repository:** [hak3du/portfolio](https://github.com/hak3du/portfolio)
- **Working branch:** `feat/zero-trust-policy-as-code`
- **Project directory:** `projects/zero-trust-policy-as-code/`
- **Status:** Initial implementation committed to the feature branch; runtime test results and CI status not yet verified.
- **Production status:** Demonstrator only. No live cloud account or deployment was changed.
- **Claims rule:** Do not claim test success, CI success, measured impact, NIST conformance, or production deployment until supported by evidence.

## Engineering log

### 2026-10-22 — Step 1: Scope and acceptance criteria

**Decision**
Build a self-contained, reviewable policy-as-code artifact rather than modifying an unrelated application or deploying cloud infrastructure.

**Acceptance criteria**
1. OPA/Rego rules evaluate Terraform plan JSON.
2. Unsafe SSH/RDP exposure, explicitly unencrypted EBS, and disabled S3 public-access protections produce actionable violations.
3. Unit tests cover positive and negative cases.
4. A compliant plan fixture produces zero violations.
5. A deliberately noncompliant fixture produces one or more violations.
6. CI runs the unit tests and fixture checks.
7. This log records every material implementation, test, and release step.

**Status:** Criteria defined; runtime acceptance tests remain pending.

### 2026-10-22 — Step 2: Isolated branch

Created the working branch `feat/zero-trust-policy-as-code` from `main` in `hak3du/portfolio`. All initial work is isolated from the default branch.

### 2026-10-22 — Step 3: Project specification

Added `README.md` with scope, local commands, evidence checklist, limitations, and accurate resume wording.

- Commit: `39a5787610b48e8fa0f94dd6ab4044720c63de8d`
- Status: Committed; not yet locally validated.

### 2026-10-22 — Step 4: Policy implementation

Added `policy/guardrails.rego` with Rego v1 rules for:
- Public IPv4 SSH exposure
- Public IPv4 RDP exposure
- Public IPv6 SSH exposure
- Public IPv6 RDP exposure
- EBS volume explicitly configured with encryption disabled
- S3 public-access-block settings explicitly disabled

- Commit: `c2312e0fefc4802d44c03021d63b869544059240`
- Design note: The current implementation checks settings represented in planned resource changes. It does not yet infer that a required control resource is missing.

### 2026-10-22 — Step 5: Unit-test coverage

Added `policy/guardrails_test.rego` for public SSH, public RDP, unencrypted EBS, a disabled S3 public-access setting, private-only SSH, and a destroy-only change.

- Commit: `1ddaf224e8defb0bd7f2301c362170abb1c2dc62`
- Status: Test cases authored; **test execution is pending**.

### 2026-10-22 — Step 6: Plan fixtures

Added:
- `examples/compliant-plan.json` — private SSH source, encrypted EBS, all four S3 public-access-block settings enabled.
- `examples/noncompliant-plan.json` — public SSH/RDP, explicitly unencrypted EBS, and one disabled S3 public-access setting.

Commits:
- Compliant fixture: `73b597b018df4b82cc2b4505e9d3c055212de1c0`
- Noncompliant fixture: `9b04d10157f34d54cdf408b40332ca619cca27f0`

Status: Fixtures authored; **OPA evaluation is pending**.

### 2026-10-22 — Step 7: Local test entry points

Added `scripts/check.sh` and `Makefile` targets for unit tests and compliant/noncompliant fixture checks.

Commits:
- Script: `ca26e68f2701cdc478e7383c7a1648bd5c59264c`
- Makefile: `3dbf8eb344207b3119c5c9cb96f16c41540b06da`

Status: Commands authored; shell execution is pending. Confirm executable permissions for `scripts/check.sh` in a local checkout; if needed, run it as `bash scripts/check.sh`.

### 2026-10-22 — Step 8: CI workflow

Added `.github/workflows/zero-trust-policy.yml` to run OPA unit tests and assert expected outcomes for both plan fixtures on relevant pull requests, pushes, and manual dispatch.

- Commit: `eca1307b92b4ccc9e76ff6cf4bd994d8387d380a`
- Status: Workflow committed to the feature branch; **GitHub Actions execution and action availability are not yet verified**.

## Next actions — in order

- [ ] Fetch the current branch files and inspect for syntax/logic issues.
- [ ] Run OPA 1.x against the policy and tests; record exact version and output.
- [ ] Fix any Rego syntax, fixture, or workflow errors; append each fix and commit SHA here.
- [ ] Confirm compliant fixture yields zero violations.
- [ ] Confirm noncompliant fixture reports the expected violations.
- [ ] Verify the GitHub Actions run by its actual run URL and status.
- [ ] Review edge cases: missing `ingress`, null/unknown planned values, IPv6 RDP/SSH, replacement actions, and absent S3 guardrail resources.
- [ ] Add policy coverage for missing required controls only after defining reliable Terraform plan semantics.
- [ ] Capture sanitized terminal output and link it here.
- [ ] Reassess the standards mapping and resume claims based on demonstrated evidence.
- [ ] Open a pull request only after the checks pass and the branch is reviewed.

## Results ledger

| Check | Expected | Observed |
|---|---|---|
| OPA unit tests | All pass | Pending |
| Compliant plan | 0 violations | Pending |
| Noncompliant plan | 1+ violations | Pending |
| CI workflow | Green | Pending |
| Live cloud deployment | Not required for this demonstrator | Not performed |

## Release note template

When a verified milestone is reached, append:
- Date/time and timezone
- Exact command
- Tool/version
- Pass/fail result
- Sanitized output or artifact URL
- Relevant commit SHA
- Known limitations / next action
