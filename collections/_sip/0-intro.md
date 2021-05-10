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

### Entities

* **User Agents (UA)**: Clients: Make requests - UAC or Servers: Receive requests - UAS.
* **Proxy server**: Is an intermediary entity that acts as both a server and a client for the purpose of making requests on behalf of other clients;
Primarily for routing, can change specific parts of the message.
* **Registrar**: Is a SIP endpoint that accepts REGISTER requests, recording the address and other parameters from the user agent, and that provides a location service for subsequent requests.
* **Redirect server**: Can also be used over Transmission Control Protocol (TCP) or the Stream Control Transmission Protocol (SCTP).
* **Session Border Controller (SBC)**: Serve as middle boxes between UA and SIP servers for various types of functions, including network topology hiding, assistance in NAT traversal, security, etc.
* **Gateway**: Can be used to interconnect a SIP network to other networks, such as the PSTN, which use different protocols or technologies.



### SIP Methods

SIP methods are sometimes referred to as SIP requests or even messages.

#### Requests

**Core methods**
* **INVITE** - The invite message initiates a SIP dialog with the intent to establish a call. It is sent by a user agent client to a user agent server.
* **ACK** - Confirm that an entity has received a final response to an INVITE request.
* **BYE** - This method signals termination of a dialog and ends a call.
* **CANCEL** - Cancel any pending request.
* **OPTIONS** - Query the capabilities of an endpoint.
* **REGISTER** - Register the SIP URI listed in the To header field with a location server and associates it with the network address given in a Contact header field.

**Extended Methods**
* **PRACK** - (Provisional Responses ACK) Provisional  (1xx responses) acknowledgement for reliability. RFC 3262.
* **SUBSCRIBE** - Initiates a subscription for notification of events from a notifier, for instance, DND has been activated. RFC 6665
* **NOTIFY** - Inform a subscriber of notifications of a new event. RFC 6665
* **PUBLISH** - Publish an event to a notification server. RFC 3903
* **INFO** - Send mid-session information that does not modify the session state. Can also be sued to transmit DTMF. RFC 6086
* **MESSAGE** - Transport text messages. RFC 3428
* **UPDATE** - Modifies the state of a session parameters. Allows a UAC to update the parameters of a session, such as the SDP and session timers. The Method has no impact on the state of a dialogue. In that sense, is like a re-INVITE, except that it can be sent before the initial INVITE has been completed. This makes it very useful for updating session parameters within early dialogues (renegotiate early media). RFC 3311
* **REFER**- Asks recipient to issue SIP request, used in transfers. RFC 3515: the message contains the “Refer-To” header field containing SIP address of the transfer agent and “Referred-By” header field which contains the SIP adddres of the initiator (the callee).


#### Responses

**1xx – Provisional**: Indicates the request has been received and it is being processed
* `100 Trying` - Extended search being performed may take a significant time so a proxy must send a 100 Trying response.
* `180 Ringing` - Destination user agent received INVITE, and is alerting user of call. This response MAY be used to initiate local ringback.
* `183 Session in Progress` - Used to convey information about the progress of the call that is not otherwise classified. This response may be used to send extra information for a call which is still being set up. The 180 Ringing message instructs the UA to create the dial-tone locally, whereas the 183 Session Progress contains an SDP, which allows for regional ring-back and carrier announcements as well.

**2xx – Successful**
* 200 OK - Ex. Indicates the request was successful.

**3xx – Redirection**
* 301 Moved Permanently - Ex. The original Request-URI is no longer valid, the new address is given in the Contact header field, and the client should update any records of the original Request-URI with the new value.

**4xx – Client Failure**
* 401 Unauthorized - Ex. The request requires user authentication. Issued by UASs and registrars.
* 403 Forbidden - Ex. The server understood the request, but is refusing to fulfil it.
* 404 Not Found - Ex. The server has definitive information that the user does not exist at the domain specified in the Request-URI.
* 408 Request Timeout - Ex. The server could not produce a response within a suitable amount of time, for example, if it could not determine the location of the user in time.
* 480 Temporarily Unavailable - Ex. Callee currently unavailable.
* 486 Busy Here - Ex. Callee is busy.
* 487 Request Terminated - Request has terminated by bye or cancel.https://www.cs.columbia.edu/sip/sipit/classification.html
* 491 Request Pending - Server has some pending request from the same dialog.

**5xx – Server Failure**
* 500 Server Internal Error - Ex. The server could not fulfill the request due to an unexpected condition.
* 503 Service Unavailable - Ex. The server is undergoing maintenance or is temporarily overloaded and so cannot process the request.

**6xx – Global Failure**
* 603 Decline - Ex. The destination does not wish to participate in the call, or cannot do so, and additionally the destination knows there are no alternative (eg voicemail) willing to accept the call.

> **Note**: The reason phrase,  is suggested in the standard, but any text can be used to convey more information.
A complete list can be found at http://www.iana.org/assignments/sip-parameters/sip-parameters.txt

### SIP Headers

Since SIP is a ASCII text-based protocol, for easy implementation and debugging. The fields listed in the message are called header fields. They have the form `Header: Value CRLF`.

#### Mandatory

* **Request-URI** -  The Request-Line-URI (start line) includes the method and the request target, (not necessarily the final destination of the call). The initial Request-URI of the message SHOULD be set to the value of the URI in the "To" field.
  * Ex. `INVITE sip:9106@ims.vodafone.pt;user=phone SIP/2.0`
* **To** - The "To" header field first and foremost specifies the desired logical recipient of the request, or the address-of-record of the user or resource that is the target of this request. This may or may not be the ultimate recipient of the request. `<URI>+<Tag>`. The initial "INVITE" doesn't have a "tag" since it's generated by the UAS.
  * Ex. `To: Alice <sip:alice@bandonga.com>`
* **From** - The From header field indicates the logical identity of the request initiator, possibly the user's address-of-record. Like the "To" header field, it contains a URI and optionally a display name (CNIP). `<DisplayName>+<Uri>+<Tag>` The "tag" in the From is mandatory and generated by the UAC;
  * Ex. `From: "Bob" <sips:bob@bandonga.com> ;tag=d69s`
* **CSeq** - The CSeq header field serves as a way to identify and order transactions.  It consists of a sequence number and a method. The method MUST match that of the request. Generated randomly by the UAC.
  * Ex. `CSeq: 4711 INVITE`
* **Call-ID** - The Call-ID header field acts as a unique identifier to group together a series of messages. It MUST be the same for all requests and responses sent by either UA in a dialog.
  * Ex. `Call-ID: f91d4fae-7gec-11e0-a765-00b0c91e6bf6@foo.bar.com`
* **Max-Forwards** - The Max-Forwards header field serves to limit the number of hops a request can transit on the way to its destination. It is initialized to some large integer and decremented by each SIP server, which receives and forwards the request, providing simple loop detection.”
  * Ex. `Max-Forwards: 70`
* **Via** - The Via header field indicates the transport used for the transaction and identifies the location where the response is to be sent. When the UAC creates a request, it MUST insert a Via into that request. The Via header field value MUST contain a branch parameter. This parameter is used to identify the transaction created by that request.
  * Ex. `Via: SIP/2.0/UDP server1.bandonga.com;branch=z9eG4bKkjshdyty`
* **Contact** - The Contact header field provides a SIP URI that can be used to contact that specific instance of the UA for subsequent requests.
  * Ex. `Contact: "Mr. Afonso" <sip:afonso@bandonga.com>;q=0.7;expires=3600`

#### Optional

* **Allow** - The Allow header field lists the set of methods supported by the UA generating the message.
  * Ex. `Allow: INVITE, ACK, OPTIONS, CANCEL, BYE`
* **Content-Type** - The Content-Type header field indicates the media type of the message-body sent to the recipient.
  * Ex. `Content-Type: application/sdp`
* **Content-Length** - The Content-Length header field indicates the size of the message-body, in decimal number of octets, sent to the recipient.
  * Ex. `Content-Length: 349`
* **P-Asserted-Identity** - The P-Asserted-Identity (PAID) header field is used among trusted SIP entities (typically intermediaries e.g. SBC) to carry the identity of the user sending a SIP message as it was verified by authentication (usually verified by the CSCF). This confirms it's safe to send the message and show the true URI identity.
  * Ex. `P-Asserted-Identity: "916139999"<sip:+351916139999@ims.bondonga.com;user=phone>`
* **RAck** - The RAck header is sent in a PRACK request to support reliability of provisional responses. It contains two numbers and a method tag. The first number is the value from the RSeq header in the provisional response that is being acknowledged. The next number, and the method, are copied from the CSeq in the response that is being acknowledged.
  * Ex. `RAck: 776656 1 INVITE`
* **Record-Route** - The Record-Route header field is inserted by proxies in a request to force future requests in the dialog to be routed through the proxy.
  * Ex. `Record-Route: sip:sip10.bandonga.com;lr`
* **Required** - If the UAC wishes to insist that a UAS understand an extension that the UAC will apply to the request in order to process the request, it MUST insert a Require header field into the request listing the option tag for that extension.
  * Ex. `Require: 100rel`
* **RSeq** - The RSeq header is used in provisional responses in order to transmit them reliably.
  * Ex. `RSeq: 988789`
* **Route** - The Route header field is used to force routing for a request through the listed set of proxies.
  * Ex. `Route: sip:sip3.bandonga.com;lr`
* **Supported** - If the UAC supports extensions (option tags) to SIP that can be applied by the server to the response, the UAC SHOULD include a Supported header field in the request listing the option tags. Full list of options ca be found here: http://www.networksorcery.com/enp/protocol/sip.htm
  * Ex. `Supported: timer, 100rel, replaces, from-change`
* **User-Agent** - The User-Agent header field contains information about the UAC originating the request.
  * Ex. `User-Agent: Softphone Beta1.5`

> Full list of requests can be found here: [http://www.networksorcery.com](http://www.networksorcery.com/enp/protocol/sip.htm)

##### Compact Headers

IANA registers headers and their abbreviations.
```
Abbr. Header           defined by                 origin (mnemonic)
a     Accept-Contact   draft-ietf-sip-callerprefs --
b     Referred-By.     -refer-                    "by"
c     Content-Type     RFC 3261
e     Content-Encoding RFC 3261
f     From             RFC 3261
i     Call-ID          RFC 3261
k     Supported        RFC 3261                   "know"
l     Content-Length   RFC 3261
m     Contact          RFC 3261                   "moved"
o     Event            -event-                    "occurance"
r     Refer-To         -refer-
s     Subject          RFC 3261
t     To               RFC 3261
u     Allow-Events     -events-                   "understand"
v     Via              RFC 3261
```

### SIP Concepts

**Transaction** - A transaction consists of a Request, any non-final (1xx) Responses received, and a final Response (2xx, 3xx, 4xx, 5xx, or 6xx), as well as the acknowledgements of the Responses (ACK or PRACK), except for ACKs to 2xx Responses.

**Dialog** - Dialog is a peer-to-peer SIP relationship between two UAs that persists for some time. Is composed by a group of Transactions;
* Dialogs are created through the generation of non-failure responses to requests with specific methods. Only 2xx and 101-199 responses with a To tag, where the request was INVITE, will establish a dialog;
* A dialog is identified at each UA with a dialog ID, which consists of a "Call-ID" value, a local "FROM" tag and a remote "TO" tag.

**Early-dialog** - A dialog established by a non-final response to a request is in the "early" state and it is called an early dialog.

**Session** - A session is just a media stream (e.g. audio or video) flowing between peers, usually consisting of RTP (and possibly RTCP) packets..

Example 1

![sip_transactions1](http://www.plantuml.com/plantuml/proxy?cache=no&fmt=svg&src=https://raw.githubusercontent.com/bandonga/bandonga.github.io/master/assets/puml/sip_transactions1.puml)

Here, (1) to (3) are one transaction. (4) is the second transaction and (5) and (6) constitute third transaction. Together, these three transaction constitute one **dialog**.

Example 2

![sip_transactions1](http://www.plantuml.com/plantuml/proxy?cache=no&fmt=svg&src=https://raw.githubusercontent.com/bandonga/bandonga.github.io/master/assets/puml/sip_transactions2.puml)

In this example, the messages from (1) to (4) constitute one transaction. This is a "no-dialog" scenario.
