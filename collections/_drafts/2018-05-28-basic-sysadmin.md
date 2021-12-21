
---
title: SRE Concepts
date: 2018-04-20 00:00:00 +01:00
header:
  teaser: "/assets/images/academy/basic_sysadmin.png"
categories:
- academy
tags:
- academy
- sysadmin
---


### Middleware
Following a merger, the addition of a service, or the expansion of available services, a business can ill afford to recreate its information systems. It is at this most critical point that it needs to integrate new components or to scale existing ones as efficiently as possible. The easiest way to integrate heterogeneous components is not to recreate them as homogeneous elements but to provide a layer that allows them to communicate despite their differences. This layer, called middleware, allows software components (applications, enterprise java beans, servlets, and other components) that have been developed independently and that run on different networked platforms to interact with one another. It is when this interaction is possible that the network can become the computer.  middleware resides between the application layer and the platform layer (the operating system and underlying network services)
Applications distributed on different network nodes use the application interface to communicate without having to be concerned with the details of the operating environments that host other applications nor with the services that connect them to these applications. In addition, by providing an administrative interface, this new, virtual system of interconnected applications can be made reliable and secure. Its performance can be measured and tuned, and it can be scaled without losing function.

Middleware can be grouped into the following categories:

Remote Procedure Call or RPC-based middleware, which allows procedures in one application to call procedures in remote applications as if they were local calls. The middleware implements a linking mechanism that locates remote procedures and makes these transparently available to a caller. Traditionally, this type of middleware handled procedure-based programs; it now also includes object-based components.

Object Request Broker or ORB-based middleware, which enables an application’s objects to be distributed and shared across heterogeneous networks. ORB-based middleware create systems of tightly-coupled components

Message Oriented Middleware or MOM-based middleware, which allows distributed applications to communicate and exchange data by sending and receiving messages.


**Software as a Service (SaaS):** The capability provided to the consumer is to use the provider’s applications running on a cloud infrastructure. The applications are accessible from various client devices through either a thin client interface, such as a web browser (e.g., web-based email), or a program interface. The consumer does not manage or control the underlying cloud infrastructure including network, servers, operating systems, storage, or even individual application capabilities, with the possible exception of limited user-specific application configuration settings.

**Platform as a Service (PaaS):** The capability provided to the consumer is to deploy onto the cloud infrastructure consumer-created or acquired applications created using programming languages, libraries, services, and tools supported by the provider. The consumer does not manage or control the underlying cloud infrastructure including network, servers, operating systems, or storage, but has control over the deployed applications and possibly configuration settings for the application-hosting environment.

**Infrastructure as a Service (IaaS):** The capability provided to the consumer is to provision processing, storage, networks, and other fundamental computing resources where the consumer is able to deploy and run arbitrary software, which can include operating systems and applications. The consumer does not manage or control the underlying cloud infrastructure but has control over operating systems, storage, and deployed applications; and possibly limited control of select networking components (e.g., host fire


An **API** (Application Programming Interface) is a set of subroutine definitions, protocols, and tools for building application software. In general terms, it is a set of clearly defined methods of communication between various software components.

**Software Stack** is a set of software subsystems or components needed to create a complete platform such that no additional software is needed to support applications.

**Software framework** is an abstraction in which software providing generic functionality can be selectively changed by additional user-written code, thus providing application-specific software. A software framework provides a standard way to build and deploy applications and is a universal, reusable software environment that provides particular functionality as part of a larger software platform to facilitate the development.
It is usually distinguished by a property called **Inversion of Control**. Contrasted with a library, where methods are called by the programmer where needed, using a framework usually means that the overall program's Control flow is dictated by the framework.

**Control flow** is the order in which individual statements, instructions or function calls of an imperative program are executed or evaluated. The emphasis on explicit control flow distinguishes an imperative programming language from a declarative programming language.

A **static web page** is delivered to the user exactly as stored, in contrast to dynamic web pages which are generated by a web application.
Consequently, a static web page displays the same information for all users, from all contexts

A **server-side dynamic** web page is a web page whose construction is controlled by an application server processing server-side scripts. In server-side scripting, parameters determine how the assembly of every new web page proceeds, including the setting up of more client-side processing.

A **client-side dynamic** web page processes the web page using HTML scripting running in the browser as it loads. JavaScript and other scripting languages determine the way the HTML in the received page is parsed into the Document Object Model, or DOM, that represents the loaded web page. The same client-side techniques can then dynamically update or change the DOM in the same way.


##### AMQP
*AMQP* used to specific those broker patters, so an application could rely on consistent behavior from any AMQP-compatible broker (thus RabbitMQ and OpenAMQ looked much the same to a client app, like two HTTP or two XMPP servers would look the same). AMQP/1.0 specifies just the connection between nodes, so you don't have guarantees of behavior. This makes AMQP/1.0 much easier for firms to implement, but doesn't deliver interoperability.
AMQP is an open internet protocol for reliably sending and receiving messages.

# SAML
* *SAML* Security Assertion Markup Language  is an open standard for exchanging authentication and authorization data between parties, in particular, between an identity provider and a service provider

The single most important use case that SAML addresses is web browser single sign-on (SSO). Single sign-on is relatively easy to accomplish within a security domain (using cookies, for example) but extending SSO across security domains is more difficult and resulted in the proliferation of non-interoperable proprietary technologies. The SAML Web Browser SSO profile was specified and standardized to promote interoperability
The SAML specification defines three roles: the principal (typically a human user), the identity provider (IdP), and the service provider (SP). In the primary use case addressed by SAML, the principal requests a service from the service provider. The service provider requests and obtains an authentication assertion from the identity provider. On the basis of this assertion, the service provider can make an access control decision, that is, it can decide whether to perform the service for the connected principal.

At the heart of the SAML assertion is a subject (a principal within the context of a particular security domain) about which something is being asserted. The subject is usually (but not necessarily) a human. As in the SAML V2.0 Technical Overview,[4] the terms subject and principal are used interchangeably in this document.

Before delivering the subject-based assertion to the SP, the IdP may request some information from the principal—such as a user name and password—in order to authenticate the principal. SAML specifies the content of the assertion that is passed from the IdP to the SP. In SAML, one identity provider may provide SAML assertions to many service providers. Similarly, one SP may rely on and trust assertions from many independent IdPs.

SAML does not specify the method of authentication at the identity provider. The IdP may use a username and password, or some other form of authentication, including multi-factor authentication. A directory service such as RADIUS, or Active Directory that allows users to log in with a user name and password is a typical source of authentication tokens at an identity provider.[5] The popular Internet social networking services also provide identity services that in theory could be used to support SAML exchanges.
* https://developers.onelogin.com/saml


--------------------------------------------------------------------------------


* containers vs docker
* virtualization vs cloud
* https://en.wikipedia.org/wiki/Microservices
* NoSQL Vs Relational Databases http://stackoverflow.com/questions/18198960/practical-example-for-each-type-of-database-real-cases
* artificial intelligence vs machine learning https://www.forbes.com/consent/?toURL=https://www.forbes.com/sites/bernardmarr/2016/12/06/what-is-the-difference-between-artificial-intelligence-and-machine-learning/#6599b26c2742
* Differentiated services: https://en.wikipedia.org/wiki/Differentiated_services
* Application Level Gateway (ALG): https://en.wikipedia.org/wiki/Application-level_gateway
* Stateful Packet Inspection (SPI): https://en.wikipedia.org/wiki/Stateful_firewall
  * Talkdesk Terminology: https://docs.google.com/document/d/18Pgw-GB9iIdjPJQrnlmS6lAVn3BTs8kbAFuzUjg-KUQ/edit
  * TAM CSM: technical account manager, Customer Service Manager
  * Call Center Glossary of Terms: https://docs.google.com/document/d/1SbBLTeANyX220IkgmoAN165VxVnLJcHBXJoTXyWZoWA/edit
* Activity Stream:
  * https://docs.google.com/presentation/d/10G_ZXugfzEYZKhb-8PST4X5hpWh8m-OLp6XcCi4o25U/edit#slide=id.g1d291ea105_0_69
  * https://docs.google.com/document/d/15i_PVOo-w-7Wx6DoVWP7rcCjOG1cy4IML2pxEfQdFoU/edit?usp=sharing
  * http://activitystrea.ms/specs/json/1.0/
  * https://hackernoon.com/getting-started-with-activity-stream-d7d5a528394c
* https://en.wikipedia.org/wiki/Event-driven_architecture
* PCI https://en.wikipedia.org/wiki/Payment_Card_Industry_Data_Security_Standard
* https://en.wikipedia.org/wiki/Business_process_outsourcing
* https://en.wikipedia.org/wiki/Stateless_protocol
* https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods
* https://en.wikipedia.org/wiki/Representational_state_transfer
*
* https://www.regular-expressions.info/quickstart.html
* https://en.wikipedia.org/wiki/Single_source_of_truth
* Mock Server: http://www.mock-server.com/#what-is-mockserver
* https://selfhostedhome.com/reverse-proxy-with-https-without-opening-ports/
* https://blog.jscrambler.com/rpc-style-vs-rest-web-apis/
* https://www.reddit.com/r/node/comments/bbya73/json_web_tokens_explanation_video/
* https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
* https://nakedsecurity.sophos.com/2019/04/24/dns-over-https-is-coming-whether-isps-and-governments-like-it-or-not/
* infoq.com/articles/application-integration-service-mesh/
* https://blog.cloudflare.com/cloudflare-architecture-and-how-bpf-eats-the-world/
* https://en.wikipedia.org/wiki/Berkeley_Packet_Filter
* https://capec.mitre.org/data/definitions/27.html
* https://hackernoon.com/magic-links-d680d410f8f7
https://www.redhat.com/en/topics/microservices/what-is-a-service-mesh https://www.howtoforge.com/sharing-terminal-sessions-with-tmux-and-screen


troubleshooting:
https://httptoolkit.tech/mock/

http:
* https://twitter.com/b0rk/status/1165623594917007362
* https://en.wikipedia.org/wiki/HTTP/2_Server_Push
* https://blog.cloudflare.com/http3-the-past-present-and-future/
* https://www.youtube.com/watch?v=idViw4anA6E&feature=youtu.be

----

#### ssh

* https://gist.github.com/nileshtrivedi/4c615e8d3c1bf053b0d31176b9e69e42
* https://www.reddit.com/r/programming/comments/bb73jo/power_of_ssh_tunneling/
* https://mosh.org/#techinfo
* https://unix.stackexchange.com/questions/22545/how-to-connect-to-a-serial-port-as-simple-as-using-ssh
* https://medium.com/hackernoon/a-gentle-introduction-to-tmux-8d784c404340
* https://wiki.gentoo.org/wiki/SSH_jump_host
* https://stackoverflow.com/questions/52563344/i-need-to-copy-a-file-from-server-a-that-i-can-only-access-by-first-connecting-t
* Port Forwarding
https://www.booleanworld.com/guide-ssh-port-forwarding-tunnelling/
https://unix.stackexchange.com/questions/115897/whats-ssh-port-forwarding-and-whats-the-difference-between-ssh-local-and-remot

http://stackoverflow.com/questions/18198960/practical-example-for-each-type-of-database-real-cases
https://www.forbes.com/consent/?toURL=https://www.forbes.com/sites/bernardmarr/2016/12/06/what-is-the-difference-between-artificial-intelligence-and-machine-learning/#6599b26c2742



#### Tunneling tools
There are a few developer tools that enable you to assign a URL on the public Internet to the app running on localhost. Here are a few that we know of.

* https://github.com/anderspitman/awesome-tunneling
* ngrok
* OpenSSH Server: Using Serveo instead of OpenSSH frees you from having to configure and maintain a server. It also handles HTTPS and subdomain generation, two features that complicate a typical SSH port-forwarding setup.
  * https://dev.to/k4ml/poor-man-ngrok-with-tcp-proxy-and-ssh-reverse-tunnel-1fm
* https://github.com/fatedier/frp



##### Setting up ngrok

Begin by downloading and installing ngrok for your system. Ngrok is a standalone executable file - you can use it as a command directly from your terminal.

```
felix@bandonga:~$ cd Downloads
felix@bandonga:~$ wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
felix@bandonga:~$ sudo mkdir /opt/ngrok
felix@bandonga:~$ sudo unzip ngrok-stable-linux-amd64.zip -d /opt/ngrok/
felix@bandonga:~$ sudo ln -s /opt/ngrok/ngrok /usr/bin/ngrok
felix@bandonga:~$ ngrok authtoken <YOUR_AUTH_TOKEN>
```



##### watchdog
A watchdog timer is an electronic timer that is used to detect and recover from computer malfunctions. During normal operation, the computer regularly resets the watchdog timer to prevent it from elapsing, or "timing out". If due to a hardware fault or program error, the computer fails to reset the watchdog, the timer will elapse and generate a timeout signal. The timeout signal is used to initiate corrective action or actions. The corrective actions typically include placing the computer system in a safe state and restoring normal system operation.

https://hexdocs.pm/watchdog/readme.html

https://linuxhint.com/linux-kernel-watchdog-explained/
