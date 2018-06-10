---
title: Java SE
date: 2018-04-20 00:00:00 +01:00
header:
  teaser: "/assets/images/academy/sysadmin.png"
categories:
- academy
tags:
- academy
- sysadmin
---



An **AS** is software framework that handles application operations from the end user to the back-end business processes and databases and provide an environment to run them.

**XA/Open XA** (Extended Architecture) describes the interface between the global transaction manager and the local resource manager. The goal of XA is to allow multiple resources (such as databases, application servers, message queues, transactional caches, etc.) to be accessed within the same transaction, thereby preserving the ACID (Atomicity, Consistency, Isolation, Durability) properties across applications. XA uses a two-phase commit to ensure that all resources either commit or roll back any particular transaction consistently.

A **distributed system** is a model in which components located on networked computers communicate and coordinate their actions by passing messages. The work is divided across similar modules and demand increases, more can be added making the system more scalable. The failure of a single module has less impact on the system, which makes the system more available. The goal is to better manage the complexity and resulting cost of providing highly available and scalable systems.
  * **Scalability** is how well a system can adapt to increased demands.
  * **High availability** requires that a system is up and running as close to 24/7 as possible, by using load balancing and failover techniques. Availability is a measure of a system's ability to process client requests without downtime.

* A **RPC** (remote procedure call) is when a computer program causes a procedure  to execute in a different address space, which is coded as if it were a local procedure call.

* With **SOA** (service-oriented architecture) services are provided to the other components by application components, through a communication protocol over a network. The basic principles of service-oriented architecture are independent of vendors, products and technologies: it logically represents a business activity with a specified outcome, is self-contained. is a black box for its consumers and may consist of other underlying services.

* An **ESB** (Enterprise Service Bus) implements a communication system between mutually interacting software applications in a SOA.

* **EAI** (Enterprise Application Integration) is an integration framework composed of a collection of technologies and services which form a middleware to enable integration of systems and applications across an enterprise.


**Software as a Service (SaaS):** The capability provided to the consumer is to use the provider’s applications running on a cloud infrastructure. The applications are accessible from various client devices through either a thin client interface, such as a web browser (e.g., web-based email), or a program interface. The consumer does not manage or control the underlying cloud infrastructure including network, servers, operating systems, storage, or even individual application capabilities, with the possible exception of limited user-specific application configuration settings.

**Platform as a Service (PaaS):** The capability provided to the consumer is to deploy onto the cloud infrastructure consumer-created or acquired applications created using programming languages, libraries, services, and tools supported by the provider. The consumer does not manage or control the underlying cloud infrastructure including network, servers, operating systems, or storage, but has control over the deployed applications and possibly configuration settings for the application-hosting environment.

**Infrastructure as a Service (IaaS):** The capability provided to the consumer is to provision processing, storage, networks, and other fundamental computing resources where the consumer is able to deploy and run arbitrary software, which can include operating systems and applications. The consumer does not manage or control the underlying cloud infrastructure but has control over operating systems, storage, and deployed applications; and possibly limited control of select networking components (e.g., host fire



http://stackoverflow.com/questions/18198960/practical-example-for-each-type-of-database-real-cases

An **API** (Application Programming Interface) is a set of subroutine definitions, protocols, and tools for building application software. In general terms, it is a set of clearly defined methods of communication between various software components.

**Software Stack** is a set of software subsystems or components needed to create a complete platform such that no additional software is needed to support applications.

**Software framework** is an abstraction in which software providing generic functionality can be selectively changed by additional user-written code, thus providing application-specific software. A software framework provides a standard way to build and deploy applications and is a universal, reusable software environment that provides particular functionality as part of a larger software platform to facilitate the development.
It is usually distinguished by a property called **Inversion of Control**. Contrasted with a library, where methods are called by the programmer where needed, using a framework usually means that the overall program's Control flow is dictated by the framework.

**Control flow** is the order in which individual statements, instructions or function calls of an imperative program are executed or evaluated. The emphasis on explicit control flow distinguishes an imperative programming language from a declarative programming language.

A **static web page** is delivered to the user exactly as stored, in contrast to dynamic web pages which are generated by a web application.
Consequently, a static web page displays the same information for all users, from all contexts

A **server-side dynamic** web page is a web page whose construction is controlled by an application server processing server-side scripts. In server-side scripting, parameters determine how the assembly of every new web page proceeds, including the setting up of more client-side processing.

A **client-side dynamic** web page processes the web page using HTML scripting running in the browser as it loads. JavaScript and other scripting languages determine the way the HTML in the received page is parsed into the Document Object Model, or DOM, that represents the loaded web page. The same client-side techniques can then dynamically update or change the DOM in the same way.
