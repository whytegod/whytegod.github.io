# Whytegod Protocol — Protocol Operation

## 1. Purpose

This document defines how the Whytegod Protocol operates as a system.

It describes how blocks, records, rules, and units interact during normal
protocol operation.

This file explains behavior.
Formal rules remain defined in the specification files.

---

## 2. Core Components

The protocol consists of four primary components:

1. Block headers
2. Records
3. Rulesets
4. Canonical chain history

Each component has a single responsibility and MUST NOT overlap in function.

---

## 3. Block Production Flow

For each new block:

1. A candidate block height is selected
2. Valid records are collected
3. A record Merkle root is computed
4. Active protocol rules are identified
5. Native unit commitment (WGD / Wert) is included
6. A block header is constructed
7. The header hash is computed
8. The block is broadcast for validation

Blocks MUST be sequential and deterministic.

---

## 4. Validation Process

Nodes independently validate blocks by checking:

- Header structure correctness
- Previous block linkage
- Record root validity
- Rules commitment validity
- Native unit commitment correctness (WGD / Wert)
- Timestamp monotonicity
- Header hash integrity

Any invalid condition results in block rejection.

---

## 5. Rulesets and Evolution

Protocol rules are defined as explicit rulesets.

- Rulesets are identified by cryptographic hashes
- Each block commits to exactly one ruleset
- Rule changes MUST be explicit and forward-only

Historical blocks are always validated under the rules they committed to.

---

## 6. Record Handling

Records are treated as opaque, immutable objects.

The protocol:
- Verifies record structure
- Anchors record hashes
- Preserves ordering

The protocol does NOT:
- Interpret record content
- Modify records
- Enforce semantic meaning

---

## 7. Units and Fees

The protocol recognizes a single native asset:

- Primary unit: **WGD**
- Smallest unit: **Wert**
- Conversion: `1 WGD = 100,000,000 Wert`

Any protocol-level fees are:
- Denominated in WGD
- Measured in Wert
- Defined externally to this document

This file does not define fee pricing.

---

## 8. Finality Model

Once a block is accepted:

- Its header is immutable
- Its records are permanent
- Its ruleset commitment is final

Chain reorganization is only possible through a strictly superior valid chain.

There is no manual override.

---

## 9. Trust Model

The protocol assumes:

- Untrusted participants
- Adversarial behavior
- Independent verification

Security arises from validation, not reputation or authority.

---

## 10. Non-Goals

The protocol intentionally excludes:

- Governance voting
- Smart contracts
- Identity systems
- Price controls
- Content moderation

These concerns belong outside the base protocol.

---

## 11. Scope Limitation

This document defines operational behavior only.

It does NOT define:
- Header structure (see headers.md)
- Record structure (see records.md)
- Supply rules (see spec.md)
- Network transport details

---

## 12. Final Principle

The protocol enforces facts, not intent.

What is committed is final.