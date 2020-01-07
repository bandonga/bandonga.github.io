---
title: "1 - Fundamentals"
excerpt: "This certification guide will provide a comprehensive overview for Implementing and Administering Cisco Networking Technologies, covering the 200-301 exam topics."
last_modified_at: 2020-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:**  Under Construction :construction:

#### Exam topics
* Explain the role and function of network components
* Describe characteristics of network topology architectures

### asd


Networks work correctly because the various devices and software follow rules, in the form of standards and protocols, which are agreements of a particular part of how a network should work.

Networking models define a structure the different layers of standards and protocols.

the people who make networking products, and the people who use those products to build their own computer networks, follow a particular networking model. That networking model defines rules about how each part of the network should work, as well as how the parts should work together so that the entire network functions correctly.

Today, TCP/IP rules as the most pervasive networking model in use. You can find support for TCP/IP on practically every computer operating system (OS) in existence today, from mobile phones to mainframe computers. Every network built using Cisco products today supports TCP/IP. And not surprisingly, the CCNA exam focuses heavily on TCP/IP. This chapter uses TCP/IP for one of its main purposes: to present various concepts about networking using the context of the different roles and functions in the TCP/IP model.





A **computer network** is a digital telecommunications network which allows nodes to share resources. In computer networks, computing devices exchange data with each other using connections (data links) between nodes. These data links are established over cable media such as twisted pair or fiber-optic cables, and wireless media such as Wi-Fi.

Network computer devices that originate, route and terminate the data are called network nodes.[1] Nodes are generally identified by network addresses, and can include hosts such as personal computers, phones, and servers, as well as networking hardware such as routers and switches. Two such devices can be said to be networked together when one device is able to exchange information with the other device, whether or not they have a direct connection to each other. In most cases, application-specific communications protocols are layered (i.e. carried as payload) over other more general communications protocols. This formidable collection of information technology requires skilled network management to keep it all running reliably.

Computer networks support an enormous number of applications and services such as access to the World Wide Web, digital video, digital audio, shared use of application and storage servers, printers, and fax machines, and use of email and instant messaging applications as well as many others. Computer networks differ in the transmission medium used to carry their signals, bandwidth, communications protocols to organize network traffic, the network's size, topology, traffic control mechanism and organizational intent. The best-known computer network is the Internet.



Computer communication links that do not support packets, such as traditional point-to-point telecommunication links, simply transmit data as a bit stream. However, the overwhelming majority of computer networks carry their data in packets. A **network packet** is a formatted unit of data (a list of bits or bytes, usually a few tens of bytes to a few kilobytes long) carried by a packet-switched network. Packets are sent through the network to their destination. A longer message is packetized before it is transferred over the transport layer (referring to the TCP/IP model), and once the packets arrive, they are then reassembled back into their original message.

Packets consist of two kinds of data: control information, and user data (payload). The control information provides data the network needs to deliver the user data; for example: source and destination network addresses, error detection codes, and sequencing information. Typically, control information is found in packet headers and trailers, with payload data in between.

With packets, the bandwidth of the transmission medium can be better shared among users than if the network were circuit switched. When one user is not sending packets, the link can be filled with packets from other users, and so the cost can be shared, with relatively little interference, provided the link isn't overused. Often the route a packet needs to take through a network is not immediately available. In that case the packet is queued and waits until a link is free.


### Laboratory

* [1.1 lab - Fundamentals](/CCNA/01.01-fundamentals-lab/)

### Practice

* [1.2 lab - Fundamentals](/CCNA/01.02-fundamentals-ex/)

### References
[^1]:
