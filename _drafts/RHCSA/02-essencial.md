---
title: "2 - Using Essential Tools"
excerpt: "This certification guide will provide a comprehensive overview of Red Hat Enterprise Linux, RHEL 7,
covering the EX200 exam topics, in order to be a RHCSA - Red Hat Certified System Administrator Guide."
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

## RHCSA Objectives
* Access a shell prompt and issue commands with correct syntax
* Use input-output redirection `(>, >>, |, 2>, etc.)`
* Use grep and regular expressions to analyse texta
* Access remote systems using ssh
* Log in and switch users in multiuser targets

* Archive, compress, unpack, and uncompress files using tar, star, * gzip, and bzip2

* Create and edit text files
* Create, delete, copy, and move files and directories

* Create hard and soft links
* List, set, and change standard ugo/rwx permissions
*
* Locate, read, and use system documentation including man, info, and files in `/usr/share/doc`


## Seccions
In order to do this guide laboratories, it's adviced to have a 64-bit computer with at least 8Gb of RAM.

All of the exam questions will be done in a VM. As such, we will install a Red Hat OS in this VM. To virtualise this VM, you can use KVM, virtualbox or vmware software, depending on your host OS.

You will also have to setup some services, that will be used in this certification.
To do that, you can use the Host Server or a secundary VM.

In our lab, we will be using the *CentOS* (the community version of RHEL), as our host OS and *KVM* to virtualise RHEL 7.
The services needed for the certification (and not part of the Exam topics) will be done in this server, using the RHEL VM exclusivily to pratice the certification. An alternative setup would be, a windows PC virtualising a RHEL box and a secundary CentOS box to setup the needed services.

> Altough the recomended usage of root commads is through `sudo command`, it's more efficient to switch to root user, through `su -`.

##

### Laboratory

* [1.1 lab - Initial Setup](/RHCSA/02.01-essencial-lab/)

### Pratice

* [1.1 lab - Initial Setup](/RHCSA/02.01-essencial-ex/)
