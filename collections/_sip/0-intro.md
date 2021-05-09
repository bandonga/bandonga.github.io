---
title: "SIP: Introduction"
excerpt: "Guide to better understand VoIP communications and protocols"
header:
  image: "/assets/images/academy/sip.png"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---


> :book: **Related with:**
* [Networking]({{ site.baseurl }}{% post_url /academy/2018-10-31-networking %})
> :warning: **NOTE:**  
* Under Construction

# Introduction

**Session Initiation Protocol** (SIP) is an application-layer signaling, presence and intant messaging protocol developed for creating, modifying and terminating multimedia sessions, standardized in the RFC 3261.

The most common applications of SIP are in Internet telephony, but has also been extended to video, request and deliver presence information as well as IM sessions, over IP networks, as well as mobile phone calling over LTE (VoLTE).

SIP is typically carried over UDP, but can also be used over TCP or SCTP and works in conjunction with several other application-layer protocols that identify and carry the session media:
* Media identification and negotiation is achieved with SDP, sent in the SIP Body;
* For the transmission of media streams (voice, video) SIP typically employs RTP, sent in different packets;

SIP also interact with other applications protocols, such as DNS (to resolve a symbolic names), DHCP (to allow an IP device to download configuration information upon initialization), or ICMP (control and diagnostic protocol that runs between single IP routing hops).

##### Entities

* **User Agents (UA)**: Clients: Make requests - UAC or Servers: Receive requests - UAS.
* **Proxy server**: Is an intermediary entity that acts as both a server and a client for the purpose of making requests on behalf of other clients;
Primarily for routing, can change specific parts of the message.
* **Registrar**: Is a SIP endpoint that accepts REGISTER requests, recording the address and other parameters from the user agent, and that provides a location service for subsequent requests.
* **Redirect server**: Can also be used over Transmission Control Protocol (TCP) or the Stream Control Transmission Protocol (SCTP).
* **Session Border Controller (SBC)**: Serve as middle boxes between UA and SIP servers for various types of functions, including network topology hiding, assistance in NAT traversal, security, etc.
* **Gateway**: Can be used to interconnect a SIP network to other networks, such as the PSTN, which use different protocols or technologies.
