# Zero Trust Infrastructure Guardrails — Terraform + OPA

A reproducible, portfolio-grade demonstration of **policy-as-code for cloud infrastructure**. Open Policy Agent (OPA) evaluates a Terraform plan JSON document and returns explicit policy violations before infrastructure is deployed.

> **Scope:** This is a demonstrator, not a claim of a complete NIST SP 800-207 implementation or a production cloud deployment. The policies currently cover selected AWS resource patterns and should be extended and validated against the target provider/version before production use.

## Security controls in this slice

- Reject AWS security groups that expose SSH (TCP/22) or RDP (TCP/3389) to the public internet.
- Reject EBS volumes explicitly configured without encryption.
- Reject S3 public-access-block configurations that disable any of the four public-access protections.
- Return actionable violation messages that identify the affected Terraform resource address.

## Repository layout

```text
projects/zero-trust-policy-as-code/
├── README.md
├── PRO_NOTES.md
├── Makefile
├── policy/
│   ├── guardrails.rego
│   └── guardrails_test.rego
├── examples/
│   ├── compliant-plan.json
│   └── noncompliant-plan.json
└── scripts/
    └── check.sh
.github/workflows/zero-trust-policy.yml
```

## Run locally

Prerequisites: [Open Policy Agent (OPA)](https://www.openpolicyagent.org/docs/latest/) CLI 1.x. The policy uses Rego v1 syntax.

From this directory:

```bash
opa version
make test
make check-compliant
make check-noncompliant
```

Expected behavior:
- `make test` runs the Rego unit tests.
- `make check-compliant` exits successfully when no violations are found.
- `make check-noncompliant` confirms that the intentionally unsafe fixture is rejected. This command itself should exit successfully when the guardrail behaves as expected.

To evaluate a real Terraform plan, create a plan file in an isolated test environment and convert it to JSON:

```bash
terraform plan -out=tfplan
terraform show -json tfplan > tfplan.json
opa eval --format pretty --data policy --input tfplan.json 'data.terraform.guardrails.deny'
```

Review the plan and remove sensitive values before sharing artifacts. Terraform plan JSON can contain sensitive infrastructure details.

## Policy behavior and limitations

- The policy inspects planned resource changes with an `after` object. Destroy-only changes are ignored.
- It checks explicitly represented resource settings. A missing control resource is not automatically inferred unless a corresponding rule is implemented.
- It is not a substitute for provider-native validation, IAM review, threat modelling, or a deployment approval process.
- The current rules are intentionally narrow and suitable for an auditable demonstration. Extend them with organization-specific requirements before operational use.

## Evidence checklist

- [ ] OPA version recorded
- [ ] Unit tests pass
- [ ] Compliant fixture produces no violations
- [ ] Noncompliant fixture produces expected violations
- [ ] CI workflow passes on the branch
- [ ] Test output and commit SHA recorded in `PRO_NOTES.md`
- [ ] Claims checked against actual code before publishing in a CV or profile

## Standards mapping

The guardrails are **informed by** Zero Trust's least-privilege and explicit-access principles. This small policy set is not, by itself, proof of conformance with NIST SP 800-207. Any standards mapping should identify the exact control objective, implementation boundary, and evidence.

## Professional positioning (accurate wording)

> Built a Terraform plan policy gate using OPA/Rego to detect selected cloud misconfigurations before deployment, with reproducible positive/negative fixtures and automated CI tests.

Add measured outcomes only after executing the tests and capturing the actual results.
