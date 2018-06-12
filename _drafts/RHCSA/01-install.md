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

### How to Get RHEL7

It's possible to get a free version of RHEL 7, if it's not used for production, in the Red Hat [developer](https://developers.redhat.com/products/rhel/download/) page.[^2]

[^2]: < https://developers.redhat.com/blog/2016/03/31/no-cost-rhel-developer-subscription-now-available >


### Virtualise

Check whether your system's CPU supports Hardware Virtualisation
```console
root@mo:~# grep -E '(vmx|svm)' /proc/cpuinfo
```

Make sure modules are loaded
```console
root@mo:~# lsmod | grep kvm
```

Install required packages
```console
root@mo:~# sudo yum groupinstall virtualization-client virtualization-platform virtualization-tools
```

The virtualization daemon which manage all of the platform is libvirtd.[^4]
```console
root@mo:~# sudo systemctl restart libvirtd
root@mo:~# sudo systemctl status libvirtd
```

[^4]: < https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/chap-installing_the_virtualization_packages >

### Installing RHEL7


```console
  ## make sure X11 forward is enabled, if using ssh
root@mo:~# virt-manager
```

Crete a new VM with the following setup example:
* Name/hostname: rhel7
* RAM: 4 GB
* DISK: 50 GB # if possible qcow2 to save snapshots


```console
root@mo:~# qemu-img create -f qcow2 -o preallocation=metadata /data/images/rhel7_1.qcow2 30G
root@mo:~# qemu-img create -f qcow2 -o preallocation=metadata /data/images/rhel7_2.qcow2 20G
root@mo:~# virt-install \
  --name=rhel7 \
  --vcpus=4 --ram=4096 \
  --disk path=/data/images/rhel7_1.qcow2,format=qcow2,cache=none,device=disk,bus=virtio \
  --disk path=/data/images/rhel7_2.qcow2,format=qcow2,cache=none,device=disk,bus=virtio \
  --disk path=/data/iso/rhel-server-7.5-x86_64-dvd.iso,device=cdrom \
  --cdrom=/home/felixmf/software/rhel-server-7.5-x86_64-dvd.iso \
  --os-type=linux \
  --os-variant=rhel7
```


Configure the partitions. This step is optional and if you are having trouble, it's possible to follow this step-by-step [video](https://youtu.be/AjdQbv3A1OI):[^3]

[^3]: < https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/index >


```console
  ## example:
root@mo:~# lsblk
NAME                    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sr0                      11:0    1 1024M  0 rom  
vda                     252:0    0   50G  0 disk
├─vda1                  252:1    0    1G  0 part /boot
└─vda2                  252:2    0   49G  0 part
  ├─rhel_mo-root 253:0    0   13G  0 lvm  /
  ├─rhel_mo-swap 253:1    0  3,9G  0 lvm  [SWAP]
  ├─rhel_mo-var  253:2    0    5G  0 lvm  /var
  ├─rhel_mo-home 253:3    0    1G  0 lvm  /home
  ├─rhel_mo-tmp  253:4    0    5G  0 lvm  /tmp
  └─rhel_mo-app  253:5    0 21,1G  0 lvm  /app
```

> The big advantage of using the "Server with GUI" installation pattern is that it provides an easy to use interface. Some tools discussed in
this book only run on a GUI.



### MANAGING GUEST VIRTUAL MACHINES WITH VIRSH

```console
root@mo:~# sudo virsh list --all
root@mo:~# sudo virsh start rhel7

sudo virt-top
```

https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Virtualization_Getting_Started_Guide/chap-Virtualization_Getting_Started-Quickstart.html
