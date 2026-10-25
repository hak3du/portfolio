# Project Index — Thabang Tony Ngoepe

This index is a working map of public engineering artifacts. It distinguishes **repository existence** from **verified runtime behavior**. Project maturity should be upgraded only when the evidence exists.

## Portfolio and presentation

| Project | Link | Current role in the portfolio | Verification priority |
|---|---|---|---|
| Interactive portfolio | [Live experience](https://hak3du.github.io/portfolio/) · [Source](https://github.com/hak3du/portfolio) | Main landing surface that should route reviewers to the strongest proof. | Test all links, keyboard navigation, responsive layouts, media loading, and the primary call to action. |
| AR experience | [Camera-free desktop preview](https://hak3du.github.io/AugmentedReality/preview.html) · [Source repository](https://github.com/hak3du/AugmentedReality) | Spatial/AR experiment and memorable presentation layer. | Desktop preview and documentation are now in main; verify CDN loading and orbit controls in a real browser, then test marker tracking on a supported mobile device. |
| Portfolio OS | [Source repository](https://github.com/hak3du/TonyNgoepe) | Alternate portfolio implementation. | Decide whether this is an active product or archive; avoid splitting visitors between competing landing pages. |

## Security engineering and infrastructure

| Project | Link | Evidence to lead with | Gaps to disclose / verify |
|---|---|---|---|
| Zero Trust Policy-as-Code | [Repository](https://github.com/hak3du/zero-trust-policy-as-code) | Terraform plan evaluation, OPA/Rego guardrails, and policy tests for public SSH/RDP ingress and cloud-storage controls. | Re-run the full test suite; test nested/unknown plan values and separate AWS ingress-rule resource types; clearly separate plan evaluation from deployment/enforcement. |
| Web Exposure Scanner | [Repository](https://github.com/hak3du/Web-exposure-scanner) | Security-oriented web exposure investigation and scanning workflows. | Record a safe test target, scope/authorisation model, reproducible commands, expected output, and false-positive handling. |
| Network Telemetry Dashboard | [Repository](https://github.com/hak3du/network-telemetry-dashboard) | Network visibility / telemetry visualization. | Add a sample dataset, architecture diagram, setup instructions, and screenshots that do not expose private data. |
| Quantum Knowledge Guard | [Repository](https://github.com/hak3du/quantum-knowledge-guard-2026) | Emerging-technology / knowledge-guard concept. | Confirm the intended project scope and runnable entry point before using it as a lead proof. |

## Cryptography and product engineering

| Project | Link | Evidence to lead with | Gaps to disclose / verify |
|---|---|---|---|
| Adaptive Hashing Encryption SDK | [AHE SDK](https://github.com/hak3du/AHE_SDK) | Experimental encryption/API implementation and modular cryptographic integration. | Document exact algorithms, versions, key handling, nonce rules, test vectors, dependency provenance, and limitations. Do not claim the construction is secure or quantum-safe without independent cryptographic review. |
| AHE Encryptor App | [Repository](https://github.com/hak3du/AHE-encryptor-App) | User-facing application for the AHE work. | Verify end-to-end encrypt/decrypt round trips, failure behavior, key/secret storage, and packaging. |
| AHE Market | [Workspace repository](https://github.com/hak3du/workspace) | Full-stack marketplace work and blockchain integration. | Confirm real authentication, persistent production database, supported transaction flows, settlement/fees, and mainnet evidence before calling it production-ready. |
| ShareTenant | [Repository](https://github.com/hak3du/ShareTenantapp) | Full-stack application engineering. | Identify the most complete user journey; publish setup, test instructions, and a short demo. |
| Frontend deployment | [Repository](https://github.com/hak3du/frontenddeployment) | Web deployment / frontend delivery. | Decide whether it is a distinct portfolio case study or supporting infrastructure for another project. |

## How to order the portfolio

For a recruiter, technical lead, or buyer, show **depth before breadth**:

1. **Lead proof — Zero Trust Policy-as-Code:** a narrow security problem, testable controls, visible pass/fail behavior, and honest limitations.
2. **Differentiator — AHE:** demonstrate implementation and test behavior; describe it as experimental cryptography unless independent review supports stronger claims.
3. **Software delivery — HPE backend experience + a runnable API/product artifact:** explain the problem, architecture, tests, and the engineering decisions you owned. Never publish confidential employer code or data.
4. **Visual hook — AR portfolio:** make it memorable, but keep a fast, accessible non-AR route to the actual technical evidence.
5. **Supporting breadth — exposure scanner, telemetry, and ShareTenant:** link these when relevant to the role instead of forcing every project into every application.

## Definition of done for each featured project

- [ ] One-sentence problem statement and intended user
- [ ] Architecture / data-flow diagram
- [ ] Prerequisites and copy-paste setup steps
- [ ] Known-good demo command or deployed link
- [ ] Automated test command and observed result
- [ ] Sample success and failure output
- [ ] Threat model, security boundaries, and known limitations
- [ ] Screenshots or a short recording with no secrets or personal data
- [ ] Clear maturity label: prototype, tested demo, or production deployment
- [ ] One next-step issue that can be completed and verified

## Audit log

Use this section to record dated evidence, not aspirations:

- **2026-10-25:** Published this index and the portfolio repository overview. Repository links were checked via GitHub; this documentation change does not itself verify that every project runs or is production-ready.
