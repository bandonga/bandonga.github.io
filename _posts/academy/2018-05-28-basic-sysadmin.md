---
title: Sysadmin - Basic concepts
date: 2018-04-20 00:00:00 +01:00
header:
  teaser: "/assets/images/academy/sysadmin.png"
categories:
- academy
tags:
- academy
- sysadmin
excerpt: "Basic concepts for a Sysadmin."
toc: true
toc_hmax: 6
---

> Related with: [Sysadmin]({{ site.baseurl }}{% post_url /academy/2018-05-18-sysadmin %})

##### AS
An *AS* is software framework that handles application operations from the end user to the back-end business processes and databases and provide an environment to run them.

##### XA/Open XA
*XA/Open XA* (Extended Architecture) describes the interface between the global transaction manager and the local resource manager. The goal of XA is to allow multiple resources (such as databases, application servers, message queues, transactional caches, etc.) to be accessed within the same transaction, thereby preserving the ACID (Atomicity, Consistency, Isolation, Durability) properties across applications. XA uses a two-phase commit to ensure that all resources either commit or roll back any particular transaction consistently.

###### Distributed System
A *distributed system* is a model in which components located on networked computers communicate and coordinate their actions by passing messages. The work is divided across similar modules and demand increases, more can be added making the system more scalable. The failure of a single module has less impact on the system, which makes the system more available. The goal is to better manage the complexity and resulting cost of providing highly available and scalable systems.

#### Scalability
*Scalability* is how well a system can adapt to increased demands.

##### High availability
*High availability* requires that a system is up and running as close to 24/7 as possible, by using load balancing and failover techniques. Availability is a measure of a system's ability to process client requests without downtime.

###### RPC
A *RPC* (Remote Procedure Call) is when a computer program causes a procedure  to execute in a different address space, which is coded as if it were a local procedure call.

### SOA
With *SOA* (service-oriented architecture) services are provided to the other components by application components, through a communication protocol over a network. The basic principles of service-oriented architecture are independent of vendors, products and technologies: it logically represents a business activity with a specified outcome, is self-contained. is a black box for its consumers and may consist of other underlying services.

### ESB
An *ESB* (Enterprise Service Bus) implements a communication system between mutually interacting software applications in a SOA.

### EAI
*EAI* (Enterprise Application Integration) is an integration framework composed of a collection of technologies and services which form a middleware to enable integration of systems and applications across an enterprise.

### MOM
*MOM* (Message-Oriented Middleware) broadly means any technology that can deliver "messages" from one user-space application to another. A message is usually understood to be a discrete piece of information, as compared to a stream.

Is an architecture for distributed system i.e. a middle layer for the whole distributed system, where there's lot of internal communication (a component is querying data, and then needs to send it to the other component, which will be doing some processing on the data) so components have to share info/data among them.

##### Message Broker
A *Message Broker* is a particular set of routing and queuing patterns, and we usually use the term "broker" specifically in MOM (as compared to HTTP, email, XMPP, etc.) Routing means, one message goes to one peer, to one of many peers, to all of many peers, etc. Queuing means messages are held in memory or disk until they can be delivered (and in some cases, acknowledged).

Message broker - is any system (in MOM) which handles messages (sending as well as receiving), or to be more precise which routes messages to the specific consumer/recipient. A Message Broker is typically built upon a MOM. The MOM provides the base communication among the applications, and things like message persistence and guaranteed delivery. "Message brokers are a building block of Message oriented middleware."

##### AMQP
*AMQP* used to specific those broker patters, so an application could rely on consistent behavior from any AMQP-compatible broker (thus RabbitMQ and OpenAMQ looked much the same to a client app, like two HTTP or two XMPP servers would look the same). AMQP/1.0 specifies just the connection between nodes, so you don't have guarantees of behavior. This makes AMQP/1.0 much easier for firms to implement, but doesn't deliver interoperability.
AMQP is an open internet protocol for reliably sending and receiving messages.
