---
title: "SIP: Introduction"
excerpt: "Guide to better understand VoIP communications and protocols"
header:
  image: "/assets/images/academy/sip.svg"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---
# Services

### Fax

Faxes (Facsimile) can be send over IP networks can be done using the T.38 fax over IP standard, usually transported using G.711.
The MIME type `image/t38` has been defined for the transport of faxes over UDPTL. While this approach is efficient, it is better to transport faxes over RTP. This allows faxes to utilize various RTP extensions including security, redundancy, and so forth. Faxes over RTP use the `audio/t38` MIME type.
As such, the SIP offer/answer exchange is needed to negotiate a fax session:

```
m=audio 38202 RTP/AVP 96
a=rtpmap:96 t38/8000
a=fmtp:96 T38FaxVersion=2;T38FaxRateManagement=transferredTCF
```

There is also a `sip.fax` media feature tag defined to indicate that a UA is fax capable and whether T.38 or G.711 will be used for transport:

```
Contact: <sip:bob-tp@pc33.example.com;transport=tcp>;+sip.fax="t38"
```
