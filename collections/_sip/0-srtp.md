---
title: "SIP: Media Security"
excerpt: "Guide to better understand VoIP communications and protocols"
header:
  image: "/assets/images/academy/sip.svg"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

## SRTP

**SRTP** (Secure RTP) is a profile extension to RTP, published as [RFC 3711](https://tools.ietf.org/html/rfc3711), that adds confidentiality, authentication, and integrity protection to RTP and RTCP sessions, taking an RTP stream and adding encryption and integrity protection before handing the media stream to UDP for transport.

Uses symmetric **keys** and **ciphers** for media stream encryption, but does not provide any key management or generation functionality. It must be performed out of band, assuming a key management protocol was used to exchange/derive a set of master keys for the set of ciphers to be used.

**SRTCP** is also defined as a Secure RTP Control Protocol. Since it is also used for multicast session control the SRTCP message authentication is mandatory in the specification although not particularly useful in VoIP applications.

#### Data flow encryption

SRTP defines how **session keys** are generated (from master cryptographic keys) utilized, or refreshed, during the lifetime of the media session, using the AES cipher in Segmented Integer Counter Mode (AES-CTR, aka AES-CM) or f8-mode, which allow block cipher to be used as a stream cipher.

The key stream is initialized with a specific initialization vector (IV) of configurable length. This algorithm allows blocks to be calculated in parallel. The result is then included in the SRTP packet and occupies the same number of bytes.
The IV is generated using:
* 112-bit salting key
* the SSRC
* the SRTP packet index number (the packet's `SEQ + ROC` -  ROllover Counter).

The inclusion of the SSRC in the IV allows the same key to be used for multiple RTP media sessions, as each will have a different SSRC.
As such, a single master secret could be used for both directions and for multiple media streams.

#### Key derivation
A key derivation function is used to derive the different keys used in a crypto context from one single master key in a cryptographically secure way. Thus, the key management protocol needs to exchange only one master key.

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

#### Authentication

To authenticate the message and protect its **integrity**, the `HMAC-SHA1` hash is performed over the packet and added to the end, making the SRTP packet slightly larger, increasing the media bandwidth requirements. Since RTP packets are smaller than the MTU size, fragmentation of SRTP should not be an issue.
Since the sequence number is protected, it also provides **replay protection**. When authentication and encryption are applied, encryption is applied before authentication.
The specification recommends 80 bits for the authentication tag. However, the use of shorter, 32 bits and 0-bit authentication tags is also discussed to reduce bandwidth  utilization

SRTP can use a number of master keys at the same time. Either communicating party can indicate which master key is to be used to encrypt a datagram in individual SRTP packets using the optional master key indicator (**MKI**) parameter. However, the MKI is rarely used in real-time communications.
The MKI is a variable length field, defined by the key management service, to refresh keys. However, a typical point-to-point session will rarely need rekeying during the session. In situations where multiple Master keys are available, key management may use MKI to identify the master key that is to be used within the cryptographic context.

SRTP is usable for extremely long-lived sessions, defining the maximum lifetime of a master key to be 248 SRTP packets. Besides the MKI, SRTP also defines a `<from,to>` mechanism for key lifetime.
With authentication we have replay protection, by keeping track of sequence numbers and using typically a sliding window approach, SRTP determines  the packet is both authentic not duplicated. If the sequence number of an arriving packet was matching an index in the replay list, it is marked a replayed packet and can be discarded.

#### Media Encryption Keys

Some approaches to securing media streams rely on the use of a PSK (Preshared Key) exchanged in advance of the session, while others use a PKI (Public Key Infrastructure) and utilize public keys for encrypting key material.
Another approach is to utilize a secured signaling channel to exchange keys or generate one-time session keys for media encryption and authentication.

* **Preshared Keys**

With **Preshared Keys** UAs have previously exchanged secret keys for a symmetric cryptographic algorithm using an out-of-band method (e.g. through security policy administration software or in a conference invitation).

Since the keying material is not carried in the signaling, does not need to be secured specifically to keep media encryption keys private. Also, since authentication is effectively provided by knowledge of the shared key, the signaling does not need to be authenticated to assure that media encryption keys are not altered.

With the same characteristics as static passwords, and encrypting successive and multiple sessions using the same pre-shared key is poor design.

An alternative approach is to use preshared keys as part of the keying material, to generate new keys for each session, and to rekey long sessions based on key entropy.

* **Public Key Infrastructure**

With a **Public Key Infrastructure** (PKI) the UA will use the other UA correspondent public keys to encrypt the RTP media packets. The public key can be encode in the signaling path or published in a directory as an element of a digital certificate.

If public key encryption is used to encrypt successive and multiple media sessions, the UA must protect the private key from disclosure. This is an improvement over preshared keys, but still not optimal. The public key encryption/decryption are more computationally intensive than symmetric key for the same length keys.
The best approach is for authenticated parties to securely negotiate a session key at the time of session setup and utilize the derived keys to encrypt the media for the duration of that session only.

For long-lasting, high-bandwidth sessions, session keys should be changed at regular intervals, so that an attacker breaking the cipher text will only expose the session encryption key and not the UA's private key.

### Authenticated Key Management and Exchange

In authenticated key management, the UAs authenticate themselves, and establish a secure signaling session, a set of session keys are exchanged or derived, that are used to generate media encryption keys to encrypt and sign media packets.

Another option is to transport the keys over a secure SIP connection (sips) by TLS, e.g. sending the keys in an SDP body. The original SDP specification defined a `k=` attribute for the transport of a symmetric key.
However, has now been deprecated due to the limited extensibility of SDP.

Approaches to key management that are usable with SRTP media.
* **SDES**: extensions to SDP carry keys, cryptographic algorithms, and other parameters needed to configure the secure media session.
* **MIKEY**: SDP is used to carry a multimedia keying payload that securely carries the keying material.
* **DTLS-SRTP Key** and **ZRTP Media Path Key Agreement**: a media path key agreement is performed to generate session keys.

##### SDES

**SDES** (Session Description Protocol Security Descriptions) is a way to use the `a=crypto` attribute in SDP to carry the keying and configuration information (encryption and integrity protection algorithm, master key lifetime, MKI number, number of bits used to encode the MKI).

The first item in the attribute is a cipher suite. This example below shows AES counter mode as the encryption cipher, a 128 bit key length and SHA-1 80 bit as the HMAC authentication algorithm. In the next item, we concatenate the master key and master salt and encode the value using base64 following the in-line: separator. The third item, separated from the keys by a `|` indicates that the master key is valid for 220 SRTP packets, and the MKI (identified as 1 and the MKI length of 32 bits. Since the MKI field is optional in SRTP, its presence, and length in bits must be signaled prior to the SRTP session.

```
m=video 41372 RTP/SAVP 31
a=crypto:1 AES_CM_128_HMAC_SHA1_80 inline:d0RmdmcmVCspeEc3QGZiNWpVLFJhQX1cfHAwJSoj|2^20|1:32
m=audio 39170 RTP/SAVP 0
a=crypto:1 AES_CM_128_HMAC_SHA1_32 inline:NzB4d1BINUAvLEw6UzF3WSJ+PSdFcGdUJShpX1Zj|2^20|1:32
```

The example shows two different master keys, one for audio and the other for video. This approach for key exchange requires some other method to protect the keys, for example, S/MIME or TLS. However, if the destination is unable to decrypt the S/MIME, the INVITE will fail.
* Note that the secure RTP session is signaled by the `RTP/SAVP` token in each of the media `m=` lines.

If keying material is carried in SDP over TLS, whether end-to-end integrity protection over the SDP or keying material is needed, or if the keying material could be altered or deleted by intermediaries.

> SDES is one of the most common key management approaches, however it does not address the "end-to-end" media encryption, unlike ZRTP.


##### MIKEY

**Multimedia Internet Keying** (MIKEY) is a key exchange protocol developed for multimedia session security, with a profile for SRTP.
Supports key exchange methods (preshared, public and Diffie-Hellman) key generation. The key exchange method chosen by the initiator must also be supported by the recipient, otherwise, the exchange will fail.

MIKEY provides its own confidentiality, integrity and authentication services, so it does not require that the entire SDP message body be encrypted, however requires message authentication to assure that it remains associated with a specific SDP and SIP message.

MIKEY uses an offer/answer model and is transported using extensions to SDP. One party sends a MIKEY message to the other party during call setup, for example, in an INVITE message.
The responding party answers with a MIKEY reply, allowing each UA to generate session keys and begin the encrypted SRTP media session. Can be used in either of two ways.
* negotiate separate security associations for each media stream
* negotiate a single security association for all media streams communicated over this common session.

We can see the `a=key-mgt` SDP attribute extension in the following SDP offer: `a=key-mgt:mikey Lkdlf3mdFLKES98fFk:wekDHJQodfje92dv...`

The token mikey indicates that the key management protocol offered is MIKEY with a base64 encoded MIKEY offer that will result in the exchange or derivation of a single session key, used in each direction of the SRTP flow.
Both media streams can use the same master key since each RTP session has a unique SSRC that results in a unique IV. If separate keys are to be used for each media stream, the `a=key-mgt` attribute line will be included after the media lines

> MIKEY has not been found to be useful for key management for real-time communication and is not widely used.

##### DTLS-SRTP

**DTLS-SRTP**



------------------------------------------------------------------------------------------------------------------------
