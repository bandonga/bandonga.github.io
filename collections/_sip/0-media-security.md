---
title: "SIP: Session Initiation Protocol"
excerpt: "Guide to better understand VoIP protocols and methods"
header:
  image: "/assets/images/academy/sip.png"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  Under Construction :construction:


# Media Security

**SRTP** (Secure RTP) is a profile extension to RTP that adds confidentiality, authentication, and integrity protection to RTP and RTCP sessions, taking an RTP stream and adding encryption and integrity protection before handing the media stream to UDP for transport.

Uses symmetric **keys** and **ciphers** for media stream encryption, but does not provide any key management or generation functionality. It must be performed out of band, assuming a key management protocol was used to exchange/derive a set of master cryptographic keys for the set of ciphers to be used.

SRTP defines how **session keys** are generated (from master cryptographic keys) utilized, or refreshed, during the lifetime of the media session, using the AES cipher in counter mode (AES-CTR, aka AES-CM).

The **key stream** is an encryption of a counter, initialized with a specific initialization vector (**IV**) of configurable length. This algorithm allows blocks to be calculated in parallel. The result is then included in the SRTP packet and occupies the same number of bytes.
The IV is generated using:
* 112-bit salting key
* the SSRC
* the SRTP packet index number (the packet's `SEQ + ROC` -  ROllover Counter).
The inclusion of the SSRC in the IV allows the same key to be used for multiple RTP media sessions, as each will have a different SSRC.
As such, a single master secret could be used for both directions and for multiple media streams.

![srtp](http://www.plantuml.com/plantuml/proxy?cache=no&fmt=svg&src=https://raw.githubusercontent.com/bandonga/bandonga.github.io/master/assets/puml/srtp.puml)

A **master key** and **master salt** are submitted to functions defined within SRTP to generate the session keys:
* The **session encryption key** is used to drive the AES encryption algorithm.
* The **session salt key** is used as input to the IV.
* The **authentication key** is used for the optional HMAC SHA-1 message authentication function.

At least one key derivation must be performed to obtain initial session keys. Subsequent key derivations may be performed depending on the cryptographic context of the SRTP stream.

#### SRTP Packet

```
        0                   1                   2                   3
      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+<+
     |V=2|P|X|  CC   |M|     PT      |       sequence number         | |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ |
     |                           timestamp                           | |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ |
     |           synchronization source (SSRC) identifier            | |
     +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+ |
     |            contributing source (CSRC) identifiers             | |
     |                               ....                            | |
     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ |
     |                   RTP extension (OPTIONAL)                    | |
   +>+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ |
   | |                          payload  ...                         | |
   | |                               +-------------------------------+ |
   | |                               | RTP padding   | RTP pad count | |
   +>+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+<+
   | ~                     SRTP MKI (OPTIONAL)                       ~ |
   | +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ |
   | :                 authentication tag (RECOMMENDED)              : |
   | +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ |
   |                                                                   |
   +- Encrypted Portion*                      Authenticated Portion ---+
```

The RTP header is not encrypted by SRTP, only the payload.

#### Authentication tag

When message authentication is used, a `HMAC SHA-1` hash is performed over the packet and added to the end, making the SRTP packet slightly larger, increasing the media bandwidth requirements. Since RTP packets are smaller than the MTU size, fragmentation of SRTP should not be an issue.
SRTP can use a number of master keys at the same time. Either communicating party can indicate which master key is to be used to encrypt a datagram in individual SRTP packets using the optional master key indicator (**MKI**) parameter. However, the MKI is rarely used in real-time communications.

When present, the authentication tag provides integrity protection over the RTP header and payload (MKI is not protected). Since the sequence number is protected, it also provides replay protection. When authentication and encryption are applied, encryption is applied before authentication.
The specification recommends 80 bits for the authentication tag. However, the use of shorter, 32 bits and 0-bit authentication tags is also discussed to reduce bandwidth  utilization

The MKI is a variable length field, defined by the key management service, to refresh keys. However, a typical point-to-point session will rarely need rekeying during the session. In situations where multiple Master keys are available, key management may use MKI to identify the master key that is to be used within the cryptographic context.

SRTP is usable for extremely long-lived sessions, defining the maximum lifetime of a master key to be 248 SRTP packets. Besides the MKI, SRTP also defines a `<from,to>` mechanism for key lifetime.
With authentication we have replay protection, by keeping track of sequence numbers and using typically a sliding window approach, SRTP determines  the packet is both authentic not diplicated. If the sequence number of an arriving packet was matching an index in the replay list, it is marked a replayed packet and can be discarded.

**SRTCP** is also defined as a Secure RTP Control Protocol. Since it is also used for multicast session control the SRTCP message authentication is mandatory in the specification although not particularly useful in VoIP applications.
