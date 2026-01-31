# Whytegod Protocol — Block Header Specification

## 1. Purpose

This document defines the block header format and validation rules
for the Whytegod Protocol.

The block header uniquely identifies a block and commits to the
state of the protocol at a specific height.

This file defines **how blocks are identified and linked**.

It does NOT define:
- Economics
- Governance
- Records structure (see records.md)
- Application logic

---

## 2. Block Header Role

A valid block header commits to:

- The previous block
- The current record root
- The protocol rules at that height
- The native unit reference (WGD/Wert)
- The time ordering of the chain

Once accepted, block headers are immutable.

---

## 3. Header Structure

A block header consists of the following fields:

| Field Name           | Description |
|---------------------|-------------|
| version             | Protocol version identifier |
| height              | Block height (starting from genesis = 0) |
| previous_block_hash | Hash of the previous block header |
| record_root         | Merkle root of all records in this block |
| timestamp           | Block creation time (unix seconds) |
| unit_commitment     | Commitment to native units (WGD / Wert) |
| rules_commitment    | Hash of protocol rules active at this height |
| header_hash         | Hash of all header fields |

---

## 4. Native Unit Commitment (ADD-ON)

Each block header MUST commit to the native unit definition.

- Primary unit: **WGD**
- Smallest unit: **Wert**
- Conversion: `1 WGD = 100,000,000 Wert`

This prevents ambiguity in value interpretation across time.

Any block that references undefined or altered units is invalid.

---

## 5. Rules Commitment (ADVANCED FIELD)

The `rules_commitment` field cryptographically binds the block to
the protocol rules active at that height.

This ensures:

- Rule changes (if any) are explicit
- Historical validation remains possible
- No silent rule mutation can occur

Nodes MUST validate blocks against the committed ruleset.

---

## 6. Timestamp Rules

- Timestamps MUST be monotonically increasing
- Timestamps MUST NOT precede the previous block timestamp
- Timestamps are advisory, not authoritative

Invalid timestamps invalidate the block.

---

## 7. Header Hashing

The `header_hash` is computed as the cryptographic hash of:


version || height || previous_block_hash || record_root || timestamp || unit_commitment || rules_commitment




The hash function is defined elsewhere in the protocol.

---

## 8. Validation Rules

A block header is valid if:

- All required fields are present
- The previous block hash matches the chain tip
- The record root is valid
- The unit commitment matches WGD/Wert
- The rules commitment is recognized
- The header hash is correct

Failure of any rule invalidates the block.

---

## 9. Immutability Guarantee

Once a block header is accepted:

- It cannot be modified
- It cannot be replaced
- It cannot be reinterpreted

The chain derives its permanence from header immutability.

---

## 10. Scope Limitation

This file defines ONLY block header structure and validation.

It does NOT define:
- Supply
- Pricing
- Ownership
- Incentives

Those are defined in other protocol documents.

---

## 11. Final Principle

Block headers are facts.

They describe **what is**, not **what should be**.