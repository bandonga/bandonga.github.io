---
title: "Networking: Introduction"
excerpt: "Guide to better understand IP Networks routing and switching"
header:
  image: "/assets/images/academy/networking.svg"
last_modified_at: 2020-01-02 21:28:04 +00:00
toc: true
---

> Related with: [Networking]({{ site.baseurl }}{% post_url /academy/2018-10-31-networking %})
> :warning: **NOTE:**  
* :construction: Under Construction

# Introduction

Α **network** is simply defined as something that connects things together for a specific purpose. It's used in a variety of contexts, including telephone, television, computer, or even people networks.
A **computer network** is a digital telecommunications network which allows computing devices to share resources, that exchange data with each other using connections (data links) between nodes, established over cable or wireless.

Network computer devices that originate, route and terminate the data are called network nodes, identified by network addresses. Two such devices can be said to be networked together when one device is able to exchange information with the other device, whether or not they have a direct connection to each other.

Computer networks differ in the transmission medium used to carry their signals, bandwidth, communications protocols to organize network traffic, the network's size, topology, traffic control mechanism and organizational intent. The best-known computer network is the Internet.

Computer communication links that do not support packets, such as traditional point-to-point telecommunication links, simply transmit data as a bit stream. However, the overwhelming majority of computer networks carry their data in packets.
A **network packet** is a formatted unit of data (a list of bits or bytes) carried by a packet-switched network.
In packet switching the routing and transferring of data by means of addressed packets so that a channel is occupied during the transmission of the packet only, and upon completion of the the channel is made available for the transfer of other traffic.

Packets consist of two kinds of data: control information, and user data (payload). The control information provides data the network needs to deliver the user data; for example: source and destination network addresses, error detection codes, and sequencing information. Typically, control information is found in packet headers and trailers, with payload data in between.

With packets, the bandwidth of the transmission medium can be better shared among users than if the network were circuit switched. When one user is not sending packets, the link can be filled with packets from other users, and so the cost can be shared, with relatively little interference, provided the link isn't overused. Often the route a packet needs to take through a network is not immediately available. In that case the packet is queued and waits until a link is free.
A longer message is packetized before it is transferred over the transport layer and once the packets arrive, they are then reassembled back into their original message.


#### Internetworking Models

Internetworking is the concept of interconnecting different types of networks to build a large, global network, such that any pair of connected hosts can exchange packets. In a internetwork we have:
* A standardized scheme to address packets to any host on any participating network;
* A standardized protocol defining format and handling of transmitted packets;
* Components interconnecting the participating networks by routing packets to their destinations based on standardized addresses.

Two network models are commonly used to describe the protocols and methods used in internetworking. The OSI and the Internet protocol suite.

#### OSI Model
The Open Systems Interconnection (OSI) reference model was created by the International Organization for Standardization (ISO) to allow communication with computers from different manufacturers.

It characterises and standardises the communication functions without regard to their underlying internal structure and technology. Its goal is the interoperability of diverse communication systems with standard protocols, organised into seven abstraction layers, using the term PDU.

#### Internet protocol suite
The Internet protocol suite is the conceptual model and set of communications protocols used on the Internet and similar computer networks. It is commonly known as TCP/IP because the original protocols in the suite.

This networking model sprouted forth from a U.S. Department of Defense (DoD) contract. Researchers at various universities volunteered to help further develop the protocols surrounding the original DoD work.

The IP suite provides end-to-end data communication specifying how data should be packetized, addressed, transmitted, routed and received. This functionality is organised into four abstraction layers which are used to sort all related protocols according to the scope of networking involved.

The OSI protocol suite that was specified as part of the OSI project was considered by many as too complicated and inefficient, and to a large extent unimplementable. Although the OSI model is often still referenced, the Internet protocol suite has become the standard for networking. TCP/IP's pragmatic approach to computer networking and to independent implementations of simplified protocols made it a practical methodology.

Layer           | PDU                | Internet model            | SS7
----------------|--------------------|---------------------------|--------------
7 Application   | Data               | Application               | HTTP, SMTP
6 Presentation  | Data               | Application               | SSL, SSH
5 Session       | Data               | Application               | sockets, APIs
4 Transport     | Segment / Datagram | Transport                 | TCP, UDP
3 Network       | Packet             | Internet / Network        | IP, PIMC
2 Data link     | Frame              | Link / Network Access     | Ethernet Frame, ATM
1 Physical      | Bit                | Physical                  | Ethernet Cable, Wi-Fi

### Application Layer
The application layer protocols provide services to the application software running on a device. It defines services that applications need, providing an interface between software running on a computer and the network itself. For example, defines how web browsers can pull the contents of a web page from a web server.

**HTTP Protocol Mechanisms**
Taking a closer look, this example shows how applications on each endpoint computer—specifically, the web browser application and web server application—use a TCP/IP application layer protocol. To make the request for a web page and return the contents of the web page, the applications use the Hypertext Transfer Protocol (HTTP).

HTTP did not exist until Tim Berners-Lee created the first web browser and web server in the early 1990s. Berners-Lee gave HTTP functionality to ask for the contents of web pages, specifically by giving the web browser the ability to request files from the server and giving the server a way to return the content of those files.

[![Image from Gyazo](https://i.gyazo.com/a658d4cd26b919bebfd21da6d0579c11.png)](https://gyazo.com/a658d4cd26b919bebfd21da6d0579c11)

To get the web page from Larry, at Step 1, Bob sends a message with an HTTP header. Generally, protocols use headers as a place to put information used by that protocol. This HTTP header includes the request to “get” a file. The request typically contains the name of the file (home.htm, in this case), or if no filename is mentioned, the web server assumes that Bob wants the default web page.

The message begins with an HTTP header, with a return code (200), which means something as simple as “OK” returned in the header. HTTP also defines other return codes so that the server can tell the browser whether the request worked. (Here is another example: If you ever looked for a web page that was not found, and then received an HTTP 404 “not found” error, you received an HTTP return code of 404.) The second message also includes the first part of the requested file.

Step 3 in Figure 1-6 shows another message from web server Larry to web browser Bob, but this time without an HTTP header. HTTP transfers the data by sending multiple messages, each with a part of the file. Rather than wasting space by sending repeated HTTP headers that list the same information, these additional messages simply omit the header.

### Transport Layer
Although many TCP/IP application layer protocols exist, the TCP/IP transport layer includes a smaller number of protocols. The two most commonly used transport layer protocols are the Transmission Control Protocol (TCP) and the User Datagram Protocol (UDP).

Transport layer protocols provide services to the application layer protocols that reside one layer higher in the TCP/IP model. How does a transport layer protocol provide a service to a higher-layer protocol.

##### TCP Error Recovery Basics
To appreciate what the transport layer protocols do, you must think about the layer above the transport layer, the application layer. Why? Well, each layer provides a service to the layer above it, like the error-recovery service provided to application layer protocols by TCP.

For example, in Figure 1-5, Bob and Larry used HTTP to transfer the home page from web server Larry to Bob’s web browser. But what would have happened if Bob’s HTTP GET request had been lost in transit through the TCP/IP network? Or, what would have happened if Larry’s response, which included the contents of the home page, had been lost? Well, as you might expect, in either case, the page would not have shown up in Bob’s browser.

TCP/IP needs a mechanism to guarantee delivery of data across a network. Because many application layer protocols probably want a way to guarantee delivery of data across a network, the creators of TCP included an error-recovery feature. To recover from errors, TCP uses the concept of acknowledgments. Figure 1-7 outlines the basic idea behind how TCP notices lost data and asks the sender to try again.

[![Image from Gyazo](https://i.gyazo.com/5b3465e40b83b7f4f7f20e851a58d829.png)](https://gyazo.com/5b3465e40b83b7f4f7f20e851a58d829)

Figure 1-7 shows web server Larry sending a web page to web browser Bob, using three separate messages. Note that this figure shows the same HTTP headers as Figure 1-6, but it also shows a TCP header. The TCP header shows a sequence number (SEQ) with each message. In this example, the network has a problem, and the network fails to deliver the TCP message (called a segment) with sequence number 2. When Bob receives messages with sequence numbers 1 and 3, but does not receive a message with sequence number 2, Bob realizes that message 2 was lost. That realization by Bob’s TCP logic causes Bob to send a TCP segment back to Larry, asking Larry to send message 2 again.

### Layer Interactions

**Same-layer interaction** - The two computers use a protocol to communicate with the same layer on another computer. The protocol defines a header that communicates what each computer wants to do.
e.g. Larry set the sequence numbers to 1, 2, and 3 so that Bob could notice when some of the data did not arrive. Larry’s TCP process created that TCP header with the sequence number; Bob’s TCP process received and reacted to the TCP segments.

**Adjacent-layer interaction** - On a single computer, one lower layer provides a service to the layer just above. The software or hardware that implements the higher layer requests that the next lower layer perform the needed function.
e.g. the higher-layer protocol (HTTP) wants error recovery, so it uses the next lower-layer protocol (TCP) to perform the service of error recovery; the lower layer provides a service to the layer above it.

### Network Layer
The application layer includes many protocols. The transport layer includes fewer protocols, most notably, TCP and UDP. The TCP/IP network layer includes a small number of protocols, but only one major protocol: the Internet Protocol (IP). In fact, the name TCP/IP is simply the names of the two most common protocols (TCP and IP) separated by a /.

IP provides several features, most importantly, addressing and routing. This section begins by comparing IP’s addressing and routing with another commonly known system that uses addressing and routing: the postal service. Following that, this section introduces IP addressing and routing.

##### How to send data
The TCP/IP application and transport layers act like the person sending letters through the postal service. These upper layers work the same way regardless of whether the endpoint host computers are on the same LAN or are separated by the entire Internet. To send a message, these upper layers ask the layer below them, the network layer, to deliver the message.

The lower layers of the TCP/IP model act more like the postal service to deliver those messages to the correct destinations. To do so, these lower layers must understand the underlying physical network because they must choose how to best deliver the data from one host to another.

So, what does this all matter to networking? Well, the network layer of the TCP/IP networking model, primarily defined by the Internet Protocol (IP), works much like the postal service. IP defines that each host computer should have a different IP address, just as the postal service defines addressing that allows unique addresses for each house, apartment, and business. Similarly, IP defines the process of routing so that devices called routers can work like the post office, forwarding packets of data so that they are delivered to the correct destinations. Just as the postal service created the necessary infrastructure to deliver letters—post offices, sorting machines, trucks, planes, and personnel—the network layer defines the details of how a network infrastructure should be created so that the network can deliver data to all computers in the network.

##### Internet Protocol Addressing Basics

IP is the major protocol, providing addressing and routing.
Routers are network devices that connect parts of the network together of the network together for routing to the right destination.
Each device needs a unique address to be identified in the network to be a IP host. This IP address follows a dotted-decimal notation (DDN).

##### Data Link and Physical Layer

Defines the protocols and hardware, needed to deliver data across the physical network.
4 steps to allow the link layer to send packets:
1. Encapsulate: creating the ethernet Frame
2. Transmit: physical layer transit bits over electric signals
3. Receive: receives the signals and recreates the bits.
4. De-encapsulates: gets the IP packet removing the ethernet trailer and header.

functions:
* physical transmition of the data
* protocols and rules that controls the use of the physical media.

##### Data Encapsulation Terminology

1. Create and encapsulate the application data with any required application layer headers. For example, the HTTP OK message can be returned in an HTTP header, followed by part of the contents of a web page.
2. Encapsulate the data supplied by the application layer inside a transport layer header. For end-user applications, a TCP or UDP header is typically used.
3. Encapsulate the data supplied by the transport layer inside a network layer (IP) header. IP defines the IP addresses that uniquely identify each computer.
4. Encapsulate the data supplied by the network layer inside a data-link layer header and trailer. This layer uses both a header and a trailer.
5. Transmit the bits. The physical layer encodes a signal onto the medium to transmit the frame.



### Laboratory

* [1.1 lab - Fundamentals](/CCNA/01.01-fundamentals-lab/)

### Practice

* [1.2 lab - Fundamentals](/CCNA/01.02-fundamentals-ex/)

### References
[^1]:
