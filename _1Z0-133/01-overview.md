---
title: 1 Overview of WebLogic Server
excerpt: 1Z0-133 Oracle WebLogic Server 12c Administration I.
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

### Explain the WebLogic Server terms: domain, server, machine and cluster

A **domain** is a logically related group of WLS resources. There are different kinds of resources in a domain, including WLS, deployed applications, clusters, security providers, JMS and JDBC elements. A single WLS product installation can be used to create and run multiple domains, or multiple product installations can be used to run a single domain.

A **server** is an instance of WLS, it can perform any task of a Java EE AS.

A **machine** is defined within a domain to represent physical hardware were servers are assigned to it. Is required by Node Manager and used by clusters.

A **cluster** has multiple managed servers running cooperatively in it which provides for failover and scalability. With HTTP clients requires a cluster proxy that provides load balancing.

Resources and services are deployed identically to each server in a cluster. The session state of one clustered server is replicated on another server in the cluster. When a server fails, another server in the cluster takes over for it and retrieves the replicated data. No information is lost and customers do not realize that a different server is now fulfilling their requests.

Clustered servers communicate with one another in two main ways: sending updates to their "backup server" when session state changes, and through cluster "heartbeats." Each clustered server sends out a signal periodically to indicate that it is still viable. If a member of the cluster misses too many heartbeats, that server has "failed".[^1]

[^1]: <https://docs.oracle.com/middleware/1212/wls/INTRO/domains.htm>


### Explain the difference between the administration server and the managed servers.

The **administration server** is the central point through which you configure and manage all domain resources. Solely in charge of the domain's configuration. It distributes configuration changes to other servers in the domain. Because an administration server is an instance of WLS, it can perform any task of a Java EE AS.

All domains contain a special server called the administration server. You use the administration server to configure and manage all of the domain resources. Any other WebLogic Servers in the domain are called managed servers, because they are managed by the administration server.

A **managed server** is an instance of WLS managed by the administration server, where your Java EE applications run (Web applications, EJBs, web services, enterprise applications).
Can be clustered with other cooperating managed servers for availability, scalability, and automatic failover.
In production domains, the applications are deployed to the managed servers. The administration server is only used for domain configuration and management.[^1]

### Describe the administrative tools

WebLogic Server can be administered and monitored by using:
* JMX (Java Management Extensions)
* The WebLogic Server administration console
* The WebLogic Scripting Tool (WLST)
* The WebLogic Diagnostic Framework (WLDF)
* The WLDF Monitoring Dashboard
* Enterprise Manager Cloud Contro

The **JMX** (Java Management Extensions) is a Java technology that supplies tools for managing and monitoring applications, system objects, devices and service-oriented networks. Those resources are represented by objects called MBeans. In the API, classes can be dynamically loaded and instantiated.

**Administration Console** is a web browser–based tool for configuring, administering, and monitoring the resources of a domain. The console application runs on the administration server and is part of the normal installation of WebLogic Server. Can be used to:
* Configure, start, and stop instances of WebLogic Server
* Configure clusters
* Configure database connectivity (JDBC)
* Configure messaging (JMS)
* Configure WebLogic Server security
* Deploy applications
* Monitor server and application performance
* View server and domain log files

The **WLST** (WebLogic Scripting Tool) is a command-line scripting environment for creating, configuring, administering, and monitoring the resources of a WebLogic Server domain.
It is part of the normal installation of WebLogic Server and capable of performing all the tasks available in the administration console, and more.

Based on the Jython programming language (the Java implementation of Python) with a set of commands that are specific to WLS.
WLST can be run interactively or in script mode. It also can be run online (connected to an administration server that allows it to manage an active domain) or offline (accessing the configuration files of an inactive domain)

To run WLST, set environment variables by running the `setWLSEnv.sh` script in `<WL_HOME>/server/bin`, and then call the JVM with the WLST class:
```
source /FMW_HOME/wlserver/server/bin/setWLSEnv.sh
$> java weblogic.WLST
Initializing WebLogic Scripting Tool (WLST) ...
Welcome to the WebLogic Server Administration Scripting
Shell
Type help() for help on available command
wls:offline>
```

To run a WLST script, after setting the environment variables, call the JVM with the weblogic.WLST class, followed by the name of the script:
```
java weblogic.WLST myscript.py
```

The **WLDF** (WebLogic Diagnostic Framework) is used to gather, generate and analyze WebLogic Server runtime data:
* Diagnostic images: It creates snapshots of the server's configuration and runtime metrics.
* Harvesters: Metric collectors can be set to periodically collect and record data.
* Watches and notifications: Watches compare data to conditions you set, and when triggered, they can send out notifications.

WLDF is part of the normal installation of WebLogic Server and can be configured and used through the administration console or WLST.
The features are configured as part of the configuration for a server in a domain. Other features are configured as system resources (diagnostic modules) that can be targeted to servers or clusters.

You use the diagnostic image capture to create a diagnostic snapshot of a server's internal runtime state at the time of the capture. This information can help Oracle support personnel analyse the cause of a server failure. You can capture an image manually by using the WebLogic Server administration console or WLST, or you can generate one automatically as part of a watch notification. A diagnostic image zip file includes the server's configuration, log cache, JVM state, work manager state, JNDI tree, and most recent harvested data.

The **Monitoring Dashboard** presents WLDF data graphically. It is part of the administration console application and can be launched from the administration console or with its own URL to graphically display active runtime data or archived data.

Enterprise Manager **Cloud Control** is a tool for administering and monitoring your entire Oracle IT infrastructure, including WebLogic Server.
* Unlike other WebLogic tools, Cloud Control enables you to administer multiple domains.
* Requires its own installation (It is not installed as part of some other component.)
* Supplies a web browser–based user interface

Composed of three main components:
* An Oracle Management Agent (simply called an agent) is responsible for monitoring the health of a target and is installed on the host on which a target runs. An agent collects information about a target and sends it through the Oracle Management Service (OMS) to the Oracle Management Repository.
* Oracle Management Services is a Java EE web application. It receives information from agents and saves that information in the Oracle Management Repository. It also provides the Grid Control console.
* The Oracle Management Repository contains a collection of Grid Control schema objects such as database jobs, packages, procedures, and views.[^2]

[^1]: <https://docs.oracle.com/middleware/1212/wls/INTRO/domains.htm>
[^2]: <https://docs.oracle.com/middleware/1212/wls/INTRO/sysadmin.htm>


### Laboratory

* [1.1 lab - Initial Setup](/1Z0-133/01.1-lab/)
