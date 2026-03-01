# IntraMind — Security Architecture

> Built for institutions where data breaches aren't just expensive — they're unacceptable.

---

## Threat Model

IntraMind is designed for environments handling:
- **Attorney-client privileged communications**
- **Protected health information**
- **Client financial data and tax computations**
- **Student records and examination content**
- **Government-classified operational data**

The security architecture assumes the worst case: every external network is hostile, every cloud provider is a potential compliance risk, and every query contains sensitive information.

<br />

## Security Layers

### Layer 1 — Physical Isolation

The server sits inside your building. It does not connect to the internet. There is no "phone home," no telemetry, no update check, no license validation call.

**Air-gapped by design, not by configuration.**

### Layer 2 — Encryption at Rest

Every document, every search index entry, every cached response is encrypted using military-grade encryption. Encryption keys are generated and stored on the server — never transmitted.

### Layer 3 — Access Control

Role-based access control enforced at the engine level, not just the UI layer. Different roles see different content. Access decisions are made before data reaches the application layer.

| Role Type | Access Level |
|-----------|-------------|
| **Administrator** | Full system access, content approval, user management |
| **Senior Staff** | Full knowledge base access, audit trail visibility |
| **General Staff** | Role-scoped access to relevant content only |
| **Public Portal** | Public information only, no authentication required |

### Layer 4 — Audit Trail

Every interaction is logged:
- Query text and timestamp
- User identity and role
- Response content and sources cited
- Document uploads, approvals, and rejections

Audit logs are append-only. They cannot be modified or deleted by any user role.

### Layer 5 — Content Governance

Documents must pass through an approval workflow before entering the knowledge base:

```
Upload → Admin Review → Approval/Rejection → Indexing
```

No document enters the searchable knowledge base without explicit approval. Rejected documents are quarantined with reason.

### Layer 6 — AI Guardrails

Domain-specific guardrails prevent the AI from:
- Providing advice outside its scope
- Generating content without source citations
- Returning results from unauthorized documents
- Operating without proper "reference only" disclaimers

<br />

## Compliance Readiness

| Framework | IntraMind Posture |
|-----------|------------------|
| **Data sovereignty** | All data remains on-premise. No cross-border transfer. |
| **HIPAA considerations** | No PHI stored. Clinical queries are conceptual, not patient-specific. |
| **NABH alignment** | Audit trail, access control, and document governance compatible with NABH requirements. |
| **Legal privilege** | Attorney-client privileged queries never leave the firm's network. |
| **DPDP Act (India)** | No personal data processing by external entities. Full data principal control. |

<br />

## What We Don't Use

| Technology | Why Not |
|-----------|---------|
| Cloud storage | Data leaves your control |
| External APIs | Queries transmitted to third parties |
| SaaS AI (ChatGPT, etc.) | Data processed on foreign servers |
| Telemetry / analytics | No usage data leaves the server |
| Auto-update mechanisms | No outbound connections of any kind |

<br />

> **Detailed security documentation, penetration test results, and compliance audit reports available under NDA.**

<br />

---

<p align="center">
  <a href="mailto:ops@cruxlabx.dev">Request security documentation →</a>
</p>
