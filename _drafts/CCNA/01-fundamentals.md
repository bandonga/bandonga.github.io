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
* Compare physical interface and cabling types  


##### Introduction


Α **network** is simply defined as something that connects things together for a specific purpose. It's used in a variety of contexts, including telephone, television, computer, or even people networks.
A **computer network** is a digital telecommunications network which allows nodes to share resources. The computing devices exchange data with each other using connections (data links) between nodes, established over cable or wireless.

Network computer devices that originate, route and terminate the data are called network nodes, identified by network addresses. Two such devices can be said to be networked together when one device is able to exchange information with the other device, whether or not they have a direct connection to each other.

Computer networks differ in the transmission medium used to carry their signals, bandwidth, communications protocols to organize network traffic, the network's size, topology, traffic control mechanism and organizational intent. The best-known computer network is the Internet.



Computer communication links that do not support packets, such as traditional point-to-point telecommunication links, simply transmit data as a bit stream. However, the overwhelming majority of computer networks carry their data in packets. A **network packet** is a formatted unit of data (a list of bits or bytes, usually a few tens of bytes to a few kilobytes long) carried by a packet-switched network. Packets are sent through the network to their destination. A longer message is packetized before it is transferred over the transport layer (referring to the TCP/IP model), and once the packets arrive, they are then reassembled back into their original message.

Packets consist of two kinds of data: control information, and user data (payload). The control information provides data the network needs to deliver the user data; for example: source and destination network addresses, error detection codes, and sequencing information. Typically, control information is found in packet headers and trailers, with payload data in between.

With packets, the bandwidth of the transmission medium can be better shared among users than if the network were circuit switched. When one user is not sending packets, the link can be filled with packets from other users, and so the cost can be shared, with relatively little interference, provided the link isn't overused. Often the route a packet needs to take through a network is not immediately available. In that case the packet is queued and waits until a link is free.

A computer network, or data network, is a digital telecommunications network which allows nodes to share resources. In computer networks, computing devices exchange data with each other using connections (data links) between nodes. These data links are established over cable media such as wires or optic cables, or wireless media such as WiFi.



##### Internetworking Models

An internetwork is the connection of multiple computer networks via a common routing technology using routers.

Internetworking is "the concept of interconnecting different types of networks to build a large, global network"[1]:169 such that any pair of connected hosts can exchange packets. To build an internetwork, the following are needed A standardized scheme to address packets to any host on any participating network; a standardized protocol defining format and handling of transmitted packets; components interconnecting the participating networks by routing packets to their destinations based on standardized addresses.

Networks work correctly because the various devices and software follow rules, in the form of standards and protocols, which are agreements of a particular part of how a network should work.

Networking models define a structure the different layers of standards and protocols.

the people who make networking products, and the people who use those products to build their own computer networks, follow a particular networking model. That networking model defines rules about how each part of the network should work, as well as how the parts should work together so that the entire network functions correctly.

A networking model, sometimes also called either a networking architecture or networking blueprint, refers to a comprehensive set of documents. Individually, each document describes one small function required for a network; collectively, these documents define everything that should happen for a computer network to work. Some documents define a protocol, which is a set of logical rules that devices must follow to communicate. Other documents define some physical requirements for networking. For example, a document could define the voltage and current levels used on a particular cable when transmitting data.  You can think of a networking model as you think of an architectural blueprint for building a house. Sure, you can build a house without the blueprint. However, the blueprint can ensure that the house has the right foundation and structure so that it will not fall down, and it has the correct hidden spaces to accommodate the plumbing, electrical, gas, and so on. Also, the many different people that build the house using the blueprint—such as framers, electricians, bricklayers, painters, and so on—know that if they follow the blueprint, their part of the work should not cause problems for the other workers.  Similarly, you could build your own network—write your own software, build your own networking cards, and so on—to create a network. However, it is much easier to simply buy and use products that already conform to some well-known networking model or blueprint. Because the networking product vendors build their products with some networking model in mind, their products should work well together.

#### Internet protocol suite
The Internet protocol suite is the conceptual model and set of communications protocols used on the Internet and similar computer networks. It is commonly known as TCP/IP because the original protocols in the suite are the Transmission Control Protocol (TCP) and the Internet Protocol (IP).

The Internet protocol suite provides end-to-end data communication specifying how data should be packetized, addressed, transmitted, routed and received. This functionality is organised into four abstraction layers which are used to sort all related protocols according to the scope of networking involved




### OSI Model
The Open Systems Interconnection (OSI) reference model was created by the International Organization for Standardization (ISO) to allow communication with computers from different manufacturers.

The Open Systems Interconnection model (OSI model) is a conceptual model that characterises and standardises the communication functions of a telecommunication or computing system without regard to their underlying internal structure and technology. Its goal is the interoperability of diverse communication systems with standard protocols. The model partitions a communication system into abstraction layers.

Layer           | Protocol data unit (PDU)       | Internet model            | SS7
----------------|--------------------------------|---------------------------|--------------
7 Application   | Data                           | Application (eg. http)    | Application
6 Presentation  | Data                           | Application (eg. ssl)     |
5 Session       | Data                           | Application (eg. Sockets) |
4 Transport     | Segment (TCP) / Datagram (UDP) | Transport                 |
3 Network       | Packet                         | Internet / Internetwork   | MTP Level 3
2 Data link     | Frame                          | Link / Network interface  | MTP Level 2
1 Physical      | Bit                            |                           | MTP Level 1













duvidas:
* PPP
Adjacent-layer interaction - The process of HTTP asking TCP to send some data and making sure that it is received correctly, for example.
* Same-layer interaction - The process of TCP on one computer marking a TCP segment as segment 1, and the receiving computer then acknowledging the receipt of TCP segment 1, for example.
* headers and trailers

### Laboratory

* [1.1 lab - Fundamentals](/CCNA/01.01-fundamentals-lab/)

### Practice

* [1.2 lab - Fundamentals](/CCNA/01.02-fundamentals-ex/)

### References
[^1]:
