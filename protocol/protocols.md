# Whytegod Protocol — Core Protocol Overview

This document describes how the Whytegod Protocol operates as a system.

It explains the interaction between blocks, headers, records, and rules,
without redefining structures already specified elsewhere.

This file is descriptive, not normative.
The specification files remain the source of truth.

---

## 1. Protocol Objective

The Whytegod Protocol exists to provide:

- Permanent record anchoring
- Neutral ordering of facts
- Cryptographic verifiability
- Long-term protocol stability

The protocol does not aim to optimize for speed, expressiveness, or governance flexibility.
Correctness and permanence take priority.

---

## 2. System Components

The protocol consists of four core components:

1. Block headers
2. Records
3. Rulesets
4. Chain history

Each component is isolated in responsibility and definition.

---

## 3. Block Flow

The protocol progresses through sequential blocks.

For each block:

1. A new block header is constructed
2. Valid records are selected
3. A record root is computed
4. Active protocol rules are committed
5. The header is validated and accepted

Blocks form a strictly ordered chain.

---

## 4. Rule Enforcement

Rules are enforced through:

- Deterministic validation
- Cryptographic commitment via `rules_root`
- Independent node verification

No central authority selects or approves rules.
Nodes reject blocks that violate known rulesets.

---

## 5. Record Handling

Records are treated as opaque payloads.

The protocol:
- Validates record structure
- Verifies authorship
- Anchors record hashes

The protocol does NOT:
- Interpret record meaning
- Enforce content policies
- Modify records after anchoring

---

## 6. Finality Model

Once a block is accepted:

- Its records are permanent
- Its ordering is fixed
- Its rule commitment is final

Reorganization is only possible through a strictly superior valid chain.
There is no manual override.

---

## 7. Upgrade Strategy

Protocol evolution occurs through:

- Introduction of new rulesets
- Explicit commitment via `rules_root`
- Forward-only compatibility

Historical blocks remain verifiable forever.
No retroactive reinterpretation is permitted.

---

## 8. Trust Model

The protocol assumes:

- Untrusted participants
- Adversarial conditions
- Partial network synchrony

Security arises from verification, not reputation.

---

## 9. Non-Goals

The protocol intentionally avoids:

- Governance voting
- Smart contracts
- Identity systems
- Application logic
- Price control mechanisms

Such features belong at higher layers, if at all.

---

## 10. Scope Clarification

This document explains protocol behavior.

It does NOT define:
- Header structure (see headers.md)
- Record format (see records.md)
- Economics or supply
- Network implementation details