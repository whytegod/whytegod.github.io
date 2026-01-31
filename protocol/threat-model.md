# Whytegod Protocol — Threat Model

## 1. Purpose

This document defines the threat model for the Whytegod Protocol.

It identifies realistic adversaries, attack surfaces, and mitigations
without assuming trusted participants or benevolent behavior.

This file strengthens security understanding.
It does NOT define protocol rules or economics.

---

## 2. Security Assumptions

The protocol assumes:

- Participants may act maliciously
- Nodes may lie, censor, or spam
- Network communication may be delayed or partitioned
- No participant is trusted by default

Security is achieved through verification, not trust.

---

## 3. Adversary Classes

### 3.1 Passive Observers

Capabilities:
- Monitor network traffic
- Observe block contents
- Analyze timing and metadata

Limitations:
- Cannot alter blocks
- Cannot forge signatures

Mitigation:
- Hash-only record anchoring
- Payload privacy is external to protocol

---

### 3.2 Malicious Record Submitters

Capabilities:
- Flood the network with records
- Submit malformed or duplicate records

Risks:
- Spam pressure
- Resource exhaustion

Mitigation:
- Deterministic validation
- Optional fee mechanisms (defined elsewhere)
- Record rejection on invalid structure

---

### 3.3 Malicious Block Producers

Capabilities:
- Attempt to include invalid records
- Attempt rule violations
- Attempt unit ambiguity (WGD/Wert manipulation)

Risks:
- Chain pollution
- Historical reinterpretation

Mitigation:
- Independent node verification
- Unit commitment in block headers
- Ruleset commitment per block

Invalid blocks are rejected deterministically.

---

### 3.4 Network-Level Adversaries

Capabilities:
- Delay message propagation
- Partition the network
- Eclipse specific nodes

Risks:
- Temporary chain forks
- Delayed finality perception

Mitigation:
- Fork-choice rules (defined elsewhere)
- Finality based on accepted chain history
- No reliance on timestamps for authority

---

### 3.5 Long-Range Attackers

Capabilities:
- Attempt to rewrite deep history
- Present alternative historical chains

Risks:
- Confusion for new or offline nodes

Mitigation:
- Ruleset commitment per block
- Immutable historical validation
- External checkpointing (optional, non-consensus)

---

## 4. Non-Threats (By Design)

The protocol is NOT vulnerable to:

- Content manipulation (payloads are opaque)
- Identity theft (no identity layer exists)
- Governance capture (no governance exists)
- Administrative override (no admin keys)

These vectors are eliminated by design, not mitigated.

---

## 5. Timestamp Manipulation

Risks:
- Slight timestamp skew
- Ordering ambiguity

Mitigation:
- Timestamps are advisory only
- Monotonic checks enforced
- No economic logic depends on precise time

---

## 6. Denial-of-Service Considerations

Risks:
- Record flooding
- Validation overload

Mitigation:
- Simple validation rules
- Stateless verification where possible
- Fee-based pressure allowed but external

The protocol favors simplicity over complexity.

---

## 7. Cryptographic Assumptions

The protocol assumes:

- Hash functions are collision-resistant
- Signature schemes are unforgeable
- Cryptographic primitives may evolve

Mitigation:
- Explicit versioning
- Forward-compatible rule commitments
- No hard dependency on a single primitive forever

---

## 8. Out-of-Scope Threats

This document does NOT cover:

- Wallet security
- Key management
- User error
- Application-layer exploits
- Exchange or custody risks

Those exist outside protocol scope.

---

## 9. Failure Philosophy

If assumptions fail:

- Nodes reject invalid data
- Chains diverge temporarily
- Verification remains possible

The protocol prefers safe failure over silent corruption.

---

## 10. Final Principle

The protocol does not attempt to prevent all attacks.

It ensures that:
- Attacks are detectable
- Invalid history is rejectable
- Truth can be independently verified