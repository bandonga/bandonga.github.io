---
title: "Kubernetes: Introduction"
excerpt: "Guide to understand kubernetes"
header:
  image: "/assets/images/academy/kubernetes.svg"
last_modified_at: 2021-12-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

# Introduction

## Background

kubernetes (k8s) is a cluster and an app orchestrator for containarized microservices.

An **orchestrator** is a system that deploys, scales and manages apps, responding dynamically to changes.
It's able to do:
* self-heal
* zero-downtime rolling updates/rollbacks

A **cloud native** app was design to run on kubernetes.

A **microservice** is an app build from multiples small specialized parts (services) that communicate and form a meaningful app.
Each microservice can have it's release and scale independently.

Kubernetes abstracts
* The container runtime, using the CRI (Container Runtime Interface), a layer that standardizes the 3rd party containers runtimes, also allowing different secure classes, such as gVisor or kata.
* The differences between clouds, allowing to balance workload across multiple different public or private cloud infrastructure.

The Kubernetes cluster has nodes and a master (aka heads, control plane), that exposes an API, scheduler to assign work, persistent store to record state, perform monitoring, respond to events, implement changes, with auto scaling and rolling updates.

* The cluster contains 1 or more masters and some nodes.
* pods are deployed to the cluster via controllers:
  * DaemonSets: run one instance of a service on every node in the cluster.
  * StatefulSets: are the stateful application  
  * CronJobs: short-lived tasks that need to run at set times.
* Apps are managed declarative, in a set of yaml file.

## Components

### Master



For production, multi-master HA is a must have (3 to 5 masters).
Apps shouldn't run on Masters.

```
                                      API
                                       |
    ___________________________________|________________________________
    |                                  |                               |
scheduler                        cluster store                     controller
```

It offers the following services:

**API Server**: all communications must go through the API Server. Exposes a RESTful API that receives YAML config files via POST requests.
These are manifest files that contain the desired state of the application (number of replicas to run, ports to be exposed, etc), that are persisted in the cluster store and deployed.

**Cluster Store**: stateful part of the master, persistently stores the entire configuration and state of the cluster (based on etcd).
Prefers consistency over availability (if it's unavailable apps will continue to run, but not update), using RAFT algorithm to handle multiple writes from different nodes.

**Controlling manager**: Implements control loops (aka watch or reconciliation loops) that monitor the cluster and respond to events (such as the endpoints, node and ReplicaSet controllers). The background loops are constantly watching the API for changes, with the aim to ensure the current state is the desired state, with the logic:
1. obtain desired state
2. observe current state
3. determine differences
4. reconcile  differences

**Scheduler**: Watches the API for new work tasks and assign them to appropriate healthy nodes, ranking nodes that are capable and selecting the highest score, according to free resources, port availability, affinity rules.

**cloud control manager**: If using a supported public cloud provider, it manages integrations with other cloud services, such as instances, LB or storage.

### Nodes

Nodes watch the API for new work assignments, to execute and report back to master through the API.

**kubelet**:  when a node joins a cluster, kubelet is installed, which registers the node with the cpu, mem and storage into the cluster.
Watches the API for new assignment, executes it and reports it back to the master. If it can't run a specific task, reports it back to the master.

**CRI** (Container Runtime Interface) is the API that Kubernetes uses to control the different runtimes that create and manage containers. It's used by kubectl to perform tasks.
It exposes an interface for 3rd party container runtimes to plug into, such as docker, containerd or CRI-O.

**Kube-proxy**: Responsible for local cluster networking. Manages IP Addresses, local IP tables, routing and load balancing the traffic on the pod's network.

**DNS** service has a static IP address that is hardcoded into every pod cluster.
Every new service is registered automatically with the cluster's DNS (CoreDNS is used).

### Packaging apps

1. package as a container
2. wrapped in a pod
3. deployed via a declarative manifest file.

### Declarative model

The desired state of an app is declared in a YAML manifest file (describing the image, number of replicas, network config) and it's
posted to the API. The Master
* Verifies the config and stores in the cluster store as the app desired state.
* Implements the desired state, were the scheduler deploys the app to a healthy node.
* Implements watch loops to to make sure the current state doesn't change from the desired state.

The state changes from `pending > downloading > starting > running`. After completing all tasks, enters in a succeeded or failed state.

### Pods

You can use a pod with a single container or using multi container pods (communicating using localhost).

```
Main + supporting container
```
