---
title: 1 - Installation
excerpt: This certification guide will provide a comprehensive overview of Red Hat Enterprise Linux, RHEL 7,
covering the EX200 exam topics, in order to be a RHCSA - Red Hat Certified System Administrator Guide.
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

### Laboratory requirments
In order to do this guide's laboratories, it's adviced to have a 64-bit computer with at least 8Gb of RAM.

All of the exam questions will be done in a VM. As such, we will install a Red Hat OS in this VM. To virtualise this VM, you can use KVM, virtualbox or vmware software, depending on your host OS.

You will also have to setup some services, that will be used in this certification.
To do that, you can use the Host Server or a secundary VM.

In our lab, we will be using the CentOS, as our host OS and KVM to virtualise RHEL 7, since it's the community version of RHEL.
The services needed for the certification (and not part of the Exam topics) will be done in this server,
using the RHEL VM exclusivily to pratice the certification.

### How to Get RHEL7

It's possible to get a free version of RHEL 7, if it's not used for production, in the Red Hat [developer](https://developers.redhat.com/products/rhel/download/) page.[^1]

[^1]: < https://developers.redhat.com/blog/2016/03/31/no-cost-rhel-developer-subscription-now-available >
