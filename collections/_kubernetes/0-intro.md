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

kubernetes (k8s) is a platform for managing  containerized workloads and microservices.

Facilitates both declarative configuration and automation and have a set of independent, composable control processes that continuously drive the current state towards the provided desired state.

Provides you with a framework to run distributed systems resiliently, with:
* Service discovery and load balancing
* Storage orchestration
* Automated rollouts / rollbacks / scaling (with zero-downtime and responding dynamically to changes)
* Automatic bin packing (can fit containers onto your nodes to make the best use of your resources)
* Self-healing
* Secret and configuration management

Kubernetes abstracts
* The container runtime, using the CRI (Container Runtime Interface), a layer that standardizes the 3rd party containers runtimes, also allowing different secure classes, such as gVisor or kata.
* The differences between clouds, allowing to balance workload across multiple different public or private cloud infrastructure.

## Components


When you deploy Kubernetes, you get a cluster.

A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications.

The worker node(s) host the Pods that are the components of the application workload. Every cluster has at least one worker node.
The control plane (aka heads / master) manages the worker nodes and the Pods in the cluster and exposes an API, scheduler to assign work, persistent store to record state, perform monitoring, respond to events, implement changes, with auto scaling and rolling updates.

![](https://d33wubrfki0l68.cloudfront.net/2475489eaf20163ec0f54ddc1d92aa8d4c87c96b/e7c81/images/docs/components-of-kubernetes.svg)


### Control Plane

The control plane's components make global decisions about the cluster (for example, scheduling), as well as detecting and responding to cluster events (for example, starting up a new pod when a deployment's replicas field is unsatisfied).

Control plane components can be run on any machine in the cluster. However, for simplicity, set up scripts typically start all control plane components on the same machine, and do not run user containers on this machine. See Creating Highly Available clusters with kubeadm for an example control plane setup that runs across multiple machines.

In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.
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

kube-apiserver
The API server is a component of the Kubernetes control plane that exposes the Kubernetes API. The API server is the front end for the Kubernetes control plane.

The main implementation of a Kubernetes API server is kube-apiserver. kube-apiserver is designed to scale horizontally—that is, it scales by deploying more instances. You can run several instances of kube-apiserver and balance traffic between those instances.

**API Server**: all communications must go through the API Server. Exposes a RESTful API that receives YAML config files via POST requests.
These are manifest files that contain the desired state of the application (number of replicas to run, ports to be exposed, etc), that are persisted in the cluster store and deployed.


etcd
Consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.

If your Kubernetes cluster uses etcd as its backing store, make sure you have a back up plan for those data.

You can find in-depth information about etcd in the official documentation.

kube-scheduler
Control plane component that watches for newly created Pods with no assigned node, and selects a node for them to run on.

Factors taken into account for scheduling decisions include: individual and collective resource requirements, hardware/software/policy constraints, affinity and anti-affinity specifications, data locality, inter-workload interference, and deadlines.

kube-controller-manager
Control plane component that runs controller processes.

Logically, each controller is a separate process, but to reduce complexity, they are all compiled into a single binary and run in a single process.

Some types of these controllers are:

Node controller: Responsible for noticing and responding when nodes go down.
Job controller: Watches for Job objects that represent one-off tasks, then creates Pods to run those tasks to completion.
Endpoints controller: Populates the Endpoints object (that is, joins Services & Pods).
Service Account & Token controllers: Create default accounts and API access tokens for new namespaces.
cloud-controller-manager
A Kubernetes control plane component that embeds cloud-specific control logic. The cloud controller manager lets you link your cluster into your cloud provider's API, and separates out the components that interact with that cloud platform from components that only interact with your cluster.
The cloud-controller-manager only runs controllers that are specific to your cloud provider. If you are running Kubernetes on your own premises, or in a learning environment inside your own PC, the cluster does not have a cloud controller manager.

As with the kube-controller-manager, the cloud-controller-manager combines several logically independent control loops into a single binary that you run as a single process. You can scale horizontally (run more than one copy) to improve performance or to help tolerate failures.

The following controllers can have cloud provider dependencies:

Node controller: For checking the cloud provider to determine if a node has been deleted in the cloud after it stops responding
Route controller: For setting up routes in the underlying cloud infrastructure
Service controller: For creating, updating and deleting cloud provider load balancers









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

Node components run on every node, maintaining running pods and providing the Kubernetes runtime environment.

kubelet
An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod.

The kubelet takes a set of PodSpecs that are provided through various mechanisms and ensures that the containers described in those PodSpecs are running and healthy. The kubelet doesn't manage containers which were not created by Kubernetes.

kube-proxy
kube-proxy is a network proxy that runs on each node in your cluster, implementing part of the Kubernetes Service concept.

kube-proxy maintains network rules on nodes. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.

kube-proxy uses the operating system packet filtering layer if there is one and it's available. Otherwise, kube-proxy forwards the traffic itself.

Container runtime
The container runtime is the software that is responsible for running containers.

Kubernetes supports container runtimes such as containerd, CRI-O, and any other implementation of the Kubernetes CRI (Container Runtime Interface).





Nodes watch the API for new work assignments, to execute and report back to master through the API.

**kubelet**:  when a node joins a cluster, kubelet is installed, which registers the node with the cpu, mem and storage into the cluster.
Watches the API for new assignment, executes it and reports it back to the master. If it can't run a specific task, reports it back to the master.

**CRI** (Container Runtime Interface) is the API that Kubernetes uses to control the different runtimes that create and manage containers. It's used by kubectl to perform tasks.
It exposes an interface for 3rd party container runtimes to plug into, such as docker, containerd or CRI-O.

**Kube-proxy**: Responsible for local cluster networking. Manages IP Addresses, local IP tables, routing and load balancing the traffic on the pod's network.

**DNS** service has a static IP address that is hardcoded into every pod cluster.
Every new service is registered automatically with the cluster's DNS (CoreDNS is used).



Addons
Addons use Kubernetes resources (DaemonSet, Deployment, etc) to implement cluster features. Because these are providing cluster-level features, namespaced resources for addons belong within the kube-system namespace.

Selected addons are described below; for an extended list of available addons, please see Addons.

DNS
While the other addons are not strictly required, all Kubernetes clusters should have cluster DNS, as many examples rely on it.

Cluster DNS is a DNS server, in addition to the other DNS server(s) in your environment, which serves DNS records for Kubernetes services.

Containers started by Kubernetes automatically include this DNS server in their DNS searches.

Web UI (Dashboard)
Dashboard is a general purpose, web-based UI for Kubernetes clusters. It allows users to manage and troubleshoot applications running in the cluster, as well as the cluster itself.

Container Resource Monitoring
Container Resource Monitoring records generic time-series metrics about containers in a central database, and provides a UI for browsing that data.

Cluster-level Logging
A cluster-level logging mechanism is responsible for saving container logs to a central log store with search/browsing interface.



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
A pod is a sandbox for hosting containers, with a network stack and kernel namespaces. The containers in a pod share the same environment (network, ip, memmory, volumes).

Pods are the minimun unit of scheduling (you you need to scale, add, remove pods).
Deployments of a pod is an atomic operation.
A pod is only "ready for service" when all containers are running.
A pod can only be scheduled to a single node (even with multi-containers)

* pods are deployed to the cluster via controllers:
  * DaemonSets: run one instance of a service on every node in the cluster.
  * StatefulSets: are the stateful application  
  * CronJobs: short-lived tasks that need to run at set times.
* Apps are managed declarative, in a set of yaml file.
