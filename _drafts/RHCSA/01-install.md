---
title: 1 - Installation
excerpt: This certification guide will provide a comprehensive overview of Red Hat Enterprise Linux, RHEL 7,
covering the EX200 exam topics, in order to be a RHCSA - Red Hat Certified System Administrator Guide.
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

### Laboratory requirments
In order to do this guide laboratories, it's adviced to have a 64-bit computer with at least 8Gb of RAM.

All of the exam questions will be done in a VM. As such, we will install a Red Hat OS in this VM. To virtualise this VM, you can use KVM, virtualbox or vmware software, depending on your host OS.

You will also have to setup some services, that will be used in this certification.
To do that, you can use the Host Server or a secundary VM.

In our lab, we will be using the *CentOS* (the community version of RHEL), as our host OS and *KVM* to virtualise RHEL 7.
The services needed for the certification (and not part of the Exam topics) will be done in this server, using the RHEL VM exclusivily to pratice the certification. An alternative setup would be, a windows PC virtualising a RHEL box and a secundary CentOS box to setup the needed services.

### Physical Host Setup

This step is optional, if you want to start with a fresh installation.

Download your favorite OS, such as [CentOS](http://isoredirect.centos.org/centos/7/isos/x86_64/).
To boot from a USB Device, you can use the [unetbootin](http://unetbootin.github.io/) or dd command

```console
marcelo@mo:~$ dd if=/data/CentOS-7-x86_64-Minimal-1804.iso of=/dev/sdb1 bs=512M; sync
```

To procred with the installation and environment configuration, you can follow the guides bellow or the [tecmint guide](https://www.tecmint.com/centos-7-installation/). [^1]

[^1]: < https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-making-usb-media >
