# Whytegod Protocol — Block Header Specification

This document defines the block header format and validation rules for the Whytegod Protocol.

The block header uniquely identifies a block and cryptographically commits to its history, records, and governing rules.  
This file defines **structure and linkage only** — it does not define economics, records, or governance processes.

---

## 1. Block Header Purpose

A block header uniquely identifies a block and commits to:

- The previous block
- The current record root
- The protocol rules active at that block
- The ordering and time of the block

Once accepted, block headers are immutable.

---

## 2. Block Header Structure

Each block header consists of the following fields:

### version
A fixed protocol version identifier used to validate header format compatibility.

### height
The sequential position of the block in the chain, starting from the genesis block.

### prev_block_hash
The cryptographic hash of the previous block header.  
This field links blocks together and enforces chain integrity.

### record_root
A cryptographic root hash committing to all records included in the block.

This ensures that records cannot be altered without invalidating the block.

### rules_root (Protocol Rules Hash)

A cryptographic hash representing the exact protocol rules active when the block was created.

This allows any observer to verify which rules governed the block **without relying on block height assumptions or external references**.

### timestamp
The time the block was created, expressed as Unix epoch time.

Timestamps must be monotonic and within accepted network bounds.

### header_hash
The final cryptographic hash of the entire block header.

This hash uniquely identifies the block and is used for verification, anchoring, and external references.

---

## 3. Validation Rules

A block header is valid if:

- All required fields are present
- `prev_block_hash` correctly references the prior block
- `record_root` matches the committed records
- `rules_root` matches a known and valid protocol ruleset
- The timestamp is valid and monotonic
- The header hash correctly commits to all header fields

Invalid headers MUST be rejected.

---

## 4. Immutability Guarantees

Once a block header is accepted:

- Its contents MUST NOT change
- Its position in the chain is fixed
- Its committed rules and records are final

This guarantees long-term verifiability and protocol neutrality.

---

## 5. Scope Clarification

This specification defines **block identification and linkage only**.

It does NOT define:
- Token economics
- Record formats
- Governance or voting mechanisms
- Network transport or node behavior

Those are defined in separate protocol documents.