---
title: "SIP: NAT"
excerpt: "Guide to better understand VoIP communications and protocols"
header:
  image: "/assets/images/academy/sip.png"
last_modified_at: 2021-05-07 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  
* Under Construction

# Network Address Translation

NAT creates mapping (binding) between inside and outside address and ports.
Mappings are temporary and expire after a TCP connection is closed with a `FIN` or inactivity  in case of UDP.

The fact NAT operates at layer 4 with TCP, does not mean the session is no longer end-to-end.
NAT never maintains a transmission control block or maps sequence number. Since it never performs retransmissions or acknowledgments, the TCP connection is with end-to-end full control and reliability.

When NAT creates a new mapping between the source, example `10.0.0.1:41223` and `18.34.6.2:33123`, rewrites the packet with the new data, modifying:

```
Layer-3 Checksum
source address
destination address
Layer-4 Checksum
source port
destination port
```

### Classification

Modern terminology, by BEHAVE working group, characterize the type of address mapping and filtering employed.

```
                                     E
  +------+                 +------+  x
  |  Y1  |                 |  Y2  |  t
  +--+---+                 +---+--+  e
     | Y1:y1            Y2:y2  |     r
     +----------+   +----------+     n
                |   |                a
        X1':x1' |   | X2':x2'        l
             +--+---+-+
.............|   NAT  |...............
             +--+---+-+              I
                |   |                n
            X:x |   | X:x            t
               ++---++               e
               |  X  |               r
               +-----+               n
                                     a
                                     l
```
Address and Port Mapping from [rfc4787](https://tools.ietf.org/html/rfc4787#section-4.1) for `ADDRESS:port`

* **Endpoint-Independent Mapping** (EIM NAT)

Formula: `X1':x1' = X2':x2' for all Y;y`. The mapping used is dependent only on the source address/port `X:x`, independent of the destination address/port.

* **Address-Dependent Mapping** (ADM NAT)

Formula: `X1':x1' = X2':x2' if only if Y2=Y1`. The mapping used is dependent on the source address/port `X:x` as well as the destination the address `Y`.

* **Address and Port Dependent Mapping** (APDM NAT)

Formula: `X1':x1' = X2':x2' if only if Y2:y2=Y1:y1`. The mapping used is dependent both on the source and destination address/port.


* **Hairpin Support** (Tromboning NAT)

If an internal host can send packets to another internal host using the external address of the other host. The NAT must look up two mappings to determine the destination.

##### IP Address Pooling options
Networks with multiples public IPs can allocate from a pool and use one of the following policies:
* **Paired IP address pooling:** means only one external IP address will be used for internal IP addresses. All the packets sent by this host will appear to come from the same IP address to the host external to the network.
* **Arbitrary IP Address:** means multiple external IPs are mapped to an internal IP address.

##### Port Assignments Options

* **Port preservation:** tries to keep the external/internal port the same. It only works with a large pool of addresses and if it runs out there are two options:
  * Switch to a non

##### Legacy Classification

Older NAT terminology classified as:
* **Full Cone**: Endpoint-Independent Mapping and Endpoint-Independent Filtering.
* **(Address)-Restricted Cone**: Endpoint-Independent Mapping and Address-Dependent Filtering.
* **Port-restricted Cone**: Endpoint-Independent Mapping and Address and Port-Dependent Filtering
* **Symmetric**: Address and Port Dependent Mapping and Address-Dependent Filtering or Address and Port-Dependent Filtering.

## SIP with NAT

Since SIP imbeds IP address and ports in the SIP headers and SDP body, the NAT address/port rewriting in the packet can be problematic.

Types of NAT mappings:
* **Endpoint-Independent Mapping:** Best for SIP and RTP Traversal
* **Address-Dependent Mapping:** Bad for SIP and RTP Traversal
* **Address and Port Dependent Mapping:** Worst for SIP and RTP Traversal

Propreties:
* **Hairpin Support:** Beneficial for SIP and RTP Traversal
