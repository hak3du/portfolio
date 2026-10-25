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
| AHE Encryptor App | [Repository](https://github.com/hak3du/AHE-encryptor-App) | Binary-only Windows artifact; source and reproducible build are not present in this repository. | Do not lead with the executable until source, reproducible build, hashes/signature, and independent review are available. README now states these limits. |
| AHE Market | [Workspace repository](https://github.com/hak3du/workspace) | Full-stack marketplace work and blockchain integration. | Confirm real authentication, persistent production database, supported transaction flows, settlement/fees, and mainnet evidence before calling it production-ready. |
| ShareTenant 2.0 | [Repository](https://github.com/hak3du/ShareTenantapp) | Internet infrastructure explorer concept covering DNS, routing, hosting, and content delivery. | Verify which data sources are live versus simulated; document provider limits and test the full request-trace flow. |
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

- **2026-10-26:** Added all 10 missing `worlds/*.html` modules referenced by the portfolio's `WORLDS` map. Static path check confirms all configured module files now exist in the default branch.
- **2026-10-26:** Added a [camera-free, orbitable AR scene preview](https://github.com/hak3du/AugmentedReality/blob/main/preview.html) and documented the separation between desktop preview and marker-tracked AR.
- **2026-10-26:** Updated the marker AR entry with pinned A-Frame/AR.js versions, guided camera launch, a floating intro-video panel, marker-loss cleanup, and reduced particle count. Embedded JavaScript syntax check passed; real browser/device QA is still outstanding.
- **2026-10-26:** Added project READMEs for [Quantum Launchpad](https://github.com/hak3du/workspace) and [ShareTenant 2.0](https://github.com/hak3du/ShareTenantapp).
- **2026-10-26:** Removed tracked local-only `.env` files from `workspace`, `Web-exposure-scanner`, and `ShareTenantapp`, replacing them with `.env.example` templates. The reviewed values were local SQLite-style connection strings, not detected service credentials; keep real secrets out of Git.
- **2026-10-26:** Audit remains **in progress**. The 2-byte `assets/audi.glb` is not a valid model; AR marker/video behavior still needs real-device verification; Zero Trust policy tests and each application's clean install/build/test path must be rerun before production claims.
- **2026-10-26:** Fixed a broken voice-asset reference in the main portfolio: the configured `voice/Contact.mp3` did not exist. The unsupported contact narration is now disabled; a static check confirms all remaining `VOICE` map paths match files in `voice/`.
