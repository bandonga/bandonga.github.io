---
title: "X - NAT"
excerpt: "How NAT works"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  Under Construction :construction:

# Network Address Translation

NAT creates mapping (binding) between inside and outside address and ports.
Mappings are temporary and expire after a TCP connection is closed with a `FIN` or inactivity  in case of UDP.

The fact NAT operates at layer 4 with TCP, does not mean the session is no longer end-to-end.
NAT never maintains a transmission control block or maps sequence number. Since it never performs retransmissions or acknowledgments, the TCP connection is with end-to-end full control and reliability.



Older NAT terminology classified as:
* full cone
* restricted cone
* symmetric

Modern terminology, by BEHAVE working group
