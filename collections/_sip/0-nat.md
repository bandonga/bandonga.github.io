---
title: "SIP: NAT"
excerpt: "Guide to better understand VoIP communications and protocols"
header:
  image: "/assets/images/academy/sip.png"
last_modified_at: 2021-05-07 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  Under Construction :construction:

# NAT

> :information_source: [NAT Concepts](/network/0-nat)

Since SIP imbeds IP address and ports in the SIP headers and SDP body, the NAT address/port rewriting in the packet can be problematic.

Types of NAT mappings:
* **Endpoint-Independent Mapping:** Best for SIP and RTP Traversal
* **Address-Dependent Mapping:** Bad for SIP and RTP Traversal
* **Address and Port Dependent Mapping:** Worst for SIP and RTP Traversal

Propreties:
* **Hairpin Support:** Beneficial for SIP and RTP Traversal
