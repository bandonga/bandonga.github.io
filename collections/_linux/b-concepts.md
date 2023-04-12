---
title: "Linux: Concepts"
permalink: /linux/concepts/
excerpt: "Notes and resources about Linux"
last_modified_at: 2018-01-02 21:28:04 +00:00
toc: true
---

##### Namespaces

In computing, a namespace is a set of signs that are used to identify and refer to objects, ensuring that all of a given set of objects have unique names so that they can be easily identified.

A Linux Namespace is a feature that partitions kernel resources such that one set of processes sees one set of resources while another set of processes sees a different set of resources. The feature works by having the same namespace for a set of resources and processes, but those namespaces refer to distinct resources

There are 8 kinds of namespaces. Namespace functionality is the same across all kinds: each process is associated with a namespace and can only see or use the resources associated with that namespace, and descendant namespaces where applicable. This way each process (or process group thereof) can have a unique view on the resources. Which resource is isolated depends on the kind of namespace that has been created for a given process group.

* Mount (mnt)
* Process ID (pid)
* Network (net)
* Interprocess Communication (ipc)
* UTS
* User ID (user)
* Control group (cgroup)
* Time

A Linux system starts out with a single namespace of each type, used by all processes. Processes can create additional namespaces and join different namespaces.


##### cgroups

The cgroup namespace type hides the identity of the control group of which process is a member. A process in such a namespace, checking which control group any process is part of, would see a path that is actually relative to the control group set at creation time, hiding its true control group position and identity.
