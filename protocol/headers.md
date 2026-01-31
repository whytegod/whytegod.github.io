# Whytegod Protocol — Block Header Specification

This document defines the block header format and validation rules
for the Whytegod protocol.

This file describes HOW blocks are identified and linked.
It does not define economics, records, or governance.

---

## 1. Block Header Purpose

A block header uniquely identifies a block and commits to:

- The previous block
- The current record root
- The protocol rules at that height

Block headers are immutable once accepted.

---

## 2. Block Header Structure

Each block header consists of the following fields,
encoded in the exact order listed below:

| Field Name        | Size        | Description |
|------------------|-------------|-------------|
| version          | 4 bytes     | Protocol version |
| previous_hash    | 32 bytes    | Hash of previous block header |
| record_root      | 32 bytes    | Merkle root of anchored records |
| timestamp        | 8 bytes     | Unix time (seconds) |
| height           | 8 bytes     | Block height |
| nonce            | 8 bytes     | Proof variable |

---

## 3. Header Hash

The block header hash is computed as:

- SHA-256(SHA-256(serialized_header))

The resulting 32-byte value is the block identifier.

---

## 4. Serialization Rules

- All integer fields are encoded as unsigned little-endian
- Hash fields are raw 32-byte values
- No optional or variable-length fields are permitted
- Headers MUST be serialized identically by all implementations

Any deviation results in an invalid block.

---

## 5. Validation Rules

A block header is valid if and only if:

1. `previous_hash` matches the hash of the previous accepted block
2. `height` equals previous height + 1
3. `timestamp` is greater than the median of recent blocks
4. `record_root` matches the computed record tree
5. The header hash satisfies the active difficulty rule

Failure of any rule invalidates the block.

---

## 6. Versioning Rules

- Version numbers increase monotonically
- Older versions remain valid unless explicitly deprecated
- Version changes MUST NOT alter historical header interpretation

---

## 7. Immutability Guarantee

Once a block header is accepted:

- Its fields MUST NOT change
- Its hash MUST remain stable
- Its position in the chain is permanent unless superseded by
  a strictly longer valid chain

---

## 8. Non-Goals

Block headers do NOT contain:

- Identities
- Transactions
- Smart contracts
- Governance data
- Arbitrary metadata

Minimalism is intentional.

---

## 9. Forward Compatibility

Future protocol upgrades MAY:

- Introduce new header versions
- Modify validation rules for future heights only

Past headers remain unchanged forever.

---

End of block header specification.