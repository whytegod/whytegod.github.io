# Whytegod Protocol — Record Specification

## 1. Purpose

This document defines the structure, rules, and lifecycle of records
within the Whytegod Protocol.

Records are the fundamental data objects anchored to the blockchain.

This file defines:
- What a record is
- How records are formed
- How records are validated
- How records become permanent

This file does NOT define:
- Block headers (see headers.md)
- Economics or supply
- Governance or identity systems

---

## 2. Definition of a Record

A record is a cryptographic commitment to data.

A record:
- Represents a single, immutable statement
- Is identified by its hash
- Is anchored into a block via the record root
- Has no executable behavior

Records do NOT:
- Execute code
- Contain logic
- Change after acceptance

---

## 3. Record Structure

Each record consists of the following fields:

| Field Name     | Description |
|---------------|-------------|
| version       | Record format version |
| timestamp     | Time the record was created |
| payload_hash  | Hash of the external data |
| author_hash   | Optional hash of the creator |
| metadata_hash | Optional metadata commitment |
| record_hash   | Hash of all record fields |

---

## 4. Payload Rules

- The protocol NEVER stores raw data
- Only cryptographic hashes are stored
- Payloads may represent documents, files, proofs, or statements

The interpretation of payloads is OUTSIDE protocol scope.

---

## 5. Record Hashing

The `record_hash` is computed as:



version || timestamp || payload_hash || author_hash || metadata_hash




The hash function MUST match the protocol standard.

---

## 6. Record Inclusion

Records become permanent through inclusion in a block.

- Multiple records MAY be included in a block
- Records are ordered deterministically
- A Merkle tree is constructed from record_hash values
- The Merkle root becomes the `record_root` in the block header

---

## 7. Anchoring Rules

A record is considered **anchored** when:

- It is included in a valid block
- The block header is accepted by the network
- The block is linked to the canonical chain

Anchored records are immutable.

---

## 8. Cost & Units (Reference Only)

Record submission MAY require a fee.

- Fees are denominated in **WGD**
- Fees are measured in **Wert**
- Fee logic is defined outside this document

This file only defines record structure, not pricing.

---

## 9. Lifecycle of a Record

1. Record is created
2. Record hash is computed
3. Record is submitted to the network
4. Record is included in a block
5. Block header commits to the record root
6. Record becomes permanent

There is NO deletion, update, or overwrite.

---

## 10. Validation Rules

A record is valid if:

- All required fields are present
- Hashes are correctly formed
- Timestamp is valid
- Record hash matches computed value

Invalid records MUST be rejected.

---

## 11. Forward Compatibility

- New record versions MAY be introduced
- Old records remain valid forever
- Versioning MUST be explicit

Backward reinterpretation is forbidden.

---

## 12. Final Principle

Records are facts.

Once anchored, they exist independently of:
- Identity
- Authority
- Trust