# Whytegod Protocol

Whytegod is a minimalist blockchain protocol designed for permanent,
verifiable record anchoring without governance, identity, or discretionary control.

The protocol prioritizes correctness, immutability, and long-term verification
over flexibility or rapid change.

This repository contains the complete protocol definition.

---

## Protocol Principles

- Fixed supply
- No governance
- No identity
- No discretionary upgrades
- Deterministic verification
- Long-term auditability

The protocol enforces rules, not intent.

---

## Native Asset

- Primary unit: **WGD**
- Smallest unit: **Wert**
- Conversion: `1 WGD = 100,000,000 Wert`

The protocol does not target price or market behavior.

---

## Repository Structure

### `/spec`
Authoritative protocol law.
If any document conflicts with the specification, the specification prevails.

- `spec.md`

### `/protocol`
Operational and structural definitions.

- `headers.md` — block header structure
- `records.md` — record format and anchoring
- `protocols.md` — protocol operation
- `threat.md` — threat model
- `economics.md` — demand-driven economic model

---

## Design Scope

The protocol defines:
- Units and supply
- Record anchoring
- Verification rules
- Security assumptions

The protocol does NOT define:
- Governance
- Smart contracts
- Identity systems
- Applications
- Price controls

These concerns are intentionally excluded.

---

## Status

This protocol is intentionally conservative.

Changes, if ever made, must preserve:
- Historical validity
- Fixed supply
- Verifiability

Backward reinterpretation is forbidden.

---

## License

Open specification.
Implementation is unrestricted.