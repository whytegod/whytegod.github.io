# Whytegod Protocol — Record Specification

This document defines how records are structured, validated, anchored, and preserved within the Whytegod Protocol.

Records are the core payload of the protocol.  
They represent **facts**, not opinions, and are designed for permanence, neutrality, and verifiability.

---

## 1. What Is a Record

A record is a cryptographically committed statement anchored into the protocol.

A record:
- Is immutable once accepted
- Has a single author
- Is verifiable by anyone
- Does not require trust in intermediaries

Records do NOT represent:
- Accounts or balances
- Messages or chat
- Governance votes

---

## 2. Record Structure

Each record consists of the following fields:

### record_id
A unique cryptographic identifier derived from the record contents.

### author
The public key or address that created and signed the record.

### payload_hash
A cryptographic hash of the record’s content.

The protocol does **not** interpret payload meaning — it only commits to its existence.

### payload_type
A short identifier describing the payload category  
(example: `document`, `proof`, `claim`, `reference`).

### timestamp
The time the record was created, expressed as Unix epoch time.

### signature
A cryptographic signature proving authorship and integrity.

---

## 3. Record Validation Rules

A record is valid if:

- All required fields are present
- The signature matches the author
- The payload hash matches the submitted content
- The timestamp is valid
- The record has not been previously anchored

Invalid records MUST be rejected.

---

## 4. Record Anchoring

Valid records are grouped into blocks and committed via the block’s `record_root`.

Once anchored:
- Records cannot be altered
- Records cannot be deleted
- Records cannot be reordered

Any change invalidates the block header.

---

## 5. Privacy Model

The protocol is **content-agnostic**.

- Payloads MAY be public or encrypted
- The protocol does NOT inspect payload content
- Only hashes are required for anchoring

This allows privacy-preserving use without sacrificing verifiability.

---

## 6. Record Lifecycle

1. Record is created and signed by the author
2. Record is broadcast to the network
3. Record is validated
4. Record is anchored into a block
5. Record becomes permanent

There is no “update” or “edit” operation.

New facts require new records.

---

## 7. Neutrality Guarantee

The protocol does not judge:
- Truthfulness
- Legality
- Intent
- Meaning

It only guarantees:
- Existence
- Order
- Integrity
- Permanence

Interpretation is external to the protocol.

---

## 8. Scope Clarification

This specification defines:
- Record format
- Validation rules
- Anchoring behavior

It does NOT define:
- Token economics
- Block production rules
- Governance
- User interfaces

Those are defined in separate documents.