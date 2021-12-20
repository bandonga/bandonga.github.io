---
title: "Docker: Introduction"
excerpt: "Guide to better understand docker containers"
header:
  image: "/assets/images/academy/docker.svg"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

# Introduction

A VM (Virtual Machine) is a hardware abstraction, it takes physical CPUs and RAM from a host, and shares it across several VMs.

Unlike VMs, containers are an application abstraction, an isolated system that do not require a full OS, sharing the host's license, and are fast to start and portable.

A Linux Containers (LXC) is an OS-level virtualization method for running multiple on a control host using a single kernel.
The kernel provides the cgroups functionality that allows limitation and prioritization of resources without the need for starting any VM, and also the namespace isolation functionality that allows complete isolation of an application's view of the OS environment, including process trees, networking, user IDs and mounted file systems.
LXC is similar to other technologies on Linux such as OpenVZ, Linux-VServer, as well as those on other OS's, such as FreeBSD jails, and Solaris Zones.

## Architecture

Docker as a technology can be referred as:
* runtime
* daemon (engine)
* orchestrator

##### runtime

Operates at a lower lever, responsible to start/stop containers and build all OS constructs, such as namespaces and cgroups.
A tiered architecture is used, with a high and low level runtime, that work together:
* **runc** - is the low level runtime that works as an interface with the underlying OS and stop/starts the containers.
