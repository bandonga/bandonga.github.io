---
title: "Kubernetes: Introduction"
excerpt: "Guide to better understand kubernetes containers"
header:
  image: "/assets/images/academy/kubernetes.svg"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

https://kubernetes.io/docs/tutorials/

https://vsupalov.com/getting-started-with-kubernetes/




http://www.channelfutures.com/iot/iot-and-shadow-it-dangerous-bedfellows

* https://medium.com/@reactiveops/reasons-why-you-should-migrate-from-heroku-to-kubernetes-on-aws-990a97232e63
* https://www.rainforestqa.com/blog/2019-04-02-why-we-moved-from-heroku-to-google-kubernetes-engine/
* https://joshrendek.com/2018/04/kubernetes-on-bare-metal/
* https://icicimov.github.io/blog/kubernetes/Kubernetes-cluster-step-by-step-Part8/
* https://www.servethehome.com/creating-the-ultimate-virtualization-and-container-setup-with-management-guis/
* https://github.com/kelseyhightower/kubernetes-the-hard-way#kubernetes-the-hard-way
* https://itnext.io/building-an-arm-kubernetes-cluster-ef31032636f9
* https://blog.kars7e.io/2018/01/14/Kubernetes-cluster-on-ARM-using-Asus-Tinkerboard/
* https://kubernetes.io/docs/setup/minikube/
* https://itnext.io/building-a-kubernetes-cluster-on-raspberry-pi-and-low-end-equipment-part-1-a768359fbba3
* https://www.reddit.com/r/kubernetes/comments/be0415/k3s_minikube_or_microk8s/
* https://medium.com/@evnsio/managing-my-home-with-kubernetes-traefik-and-raspberry-pis-d0330effea9a
* https://github.com/clayshek/terraform-raspberrypi-bootstrap
* https://www.openfaas.com/
* https://turingpi.com/
* https://github.com/ljfranklin/k8s-pi
* https://github.com/geerlingguy/turing-pi-cluster
* https://www.amazon.com/Cloudlet-CASE-Raspberry-Computers-Compatible/dp/B07D5MJ7PQ?th=1
* https://dev.to/awwsmm/building-a-raspberry-pi-hadoop-spark-cluster-8b2
* https://opensource.com/users/clcollins
* kubernetes: https://github.com/zimmertr/Bootstrap-Kubernetes-with-QEMU
* https://www.freecodecamp.org/news/learn-kubernetes-in-under-3-hours-a-detailed-guide-to-orchestrating-containers-114ff420e882/
* https://www.youtube.com/watch?v=X48VuDVv0do&feature=youtu.be

Tools

https://k8slens.dev/


---
title: Kubernetes
date: 2021-05-27 00:00:00 +01:00
header:
  teaser: "/assets/images/academy/kubernetes.svg"
  image: "/assets/images/academy/kubernetes.svg"
categories:
- academy
tags:
- academy
- sre
- kubernetes
excerpt: "Linux is a free and open-source software (FOSS) operating systems built around the Linux kernel, packaged in a distro, by Linus Torvalds."
---

> :book: Related with: [SRE]({{ site.baseurl }}{% post_url /academy/2018-06-31-sre %}).
> :blue_book: **Topics:**
* [Kubernetes Administration](/kubernetes/0-start/)

Linux is a free and open-source software (FOSS) operating systems built around the Linux kernel, packaged in a distro, by Linus Torvalds.

The main distros for the Enterprise Servers are the Red Hat *RHEL*, SUSE *SLES* (based on Slackware) and *Ubuntu Server* (based on Debian). There is also *Debian* and *Oracle Linux* (based on RHEL, but with Oracle Support).

For desktop, the most common are probably *fedora* or *ubuntu* distros, but there are too many, for different proposes, such as *lubuntu*, that works really well on old computers.
Another worthy mention is the *alpine*, *arch*,  and *gentoo* independent distros. Highly customizable, but recommended only for advanced users.  See more in this [image](https://upload.wikimedia.org/wikipedia/commons/8/83/Linux_Distribution_Timeline_27_02_21.svg) or let [distro chooser](https://distrochooser.de/en) get the best Linux for you.

### Resources

#### General
* [kubernetes.io Documentation](https://kubernetes.io/docs)

https://kubernetes.io/docs/tutorials/kubernetes-basics/
https://github.com/tomhuang12/awesome-k8s-resources

#### Course
* [bandonga - RHCSA: Red Hat Certified System Administrator](/RHCSA/0-start/)
* [Udemy - Red Hat: RHEL Technical Overview](https://www.edx.org/course/introduction-to-kubernetes?index=product&queryID=e76c9c97c2ba1d72531ca047110a48d6&position=1)

#### Books
* ["UNIX and Linux System Administration Handbook"](https://www.amazon.com/dp/0131480057/), by Evi Nemeth,  et al


#### Tutorials
* [Ops Schools](http://www.omnisecu.com/gnu-linux/index.php)
* [OmniSecu](http://www.opsschool.org/en/latest/unix_101.htm)


#### Certification
If you wish to get certified, the standard is by Red Hat. We recommend to start with the [RHCSA](https://www.redhat.com/en/services/certification/rhcsa) certification and follow our **[guide](/RHCSA/0-start/)**. As an alternative, you can check the [Linux Professional Institute](http://www.lpi.org/our-certifications/summary-of-certifications) and [Linux Foundation](https://training.linuxfoundation.org/certification) certification programs.


##### References:
  * r/linuxadmin [start](https://www.reddit.com/r/linuxadmin/comments/2s924h/how_did_you_get_your_start/cnnw1ma);
  * https://hackr.io/tutorials/learn-kubernetes
