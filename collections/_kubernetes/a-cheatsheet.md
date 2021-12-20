---
title: "Kubernetes: Introduction"
excerpt: "Guide to better understand kubernetes containers"
header:
  image: "/assets/images/academy/kubernetes.svg"
last_modified_at: 2021-01-02 21:28:04 +00:00
toc: true
---

> :warning: **NOTE:** Under Construction

# Introduction


https://kubernetes.io/docs/reference/kubectl/cheatsheet/


```console
~ $ kubectl config get-contexts

~ $ kubectl config use-context lab

~ $ kubectl config use-context lab
~ $ kubectl config set-context --current --namespace=context-name


~ $ kubectl get service --all-namespaces


~ $ kubectl get service -n default service_name


~ $ kubectl get pods
~ $ kubectl get pods --selector=app=app_name --all-namespaces
k get pods --namespace=context-name

  ##
kubectl exec --stdin --tty app_name-9458d65b5-4hppd -- bash
k exec --stdin --tty --namespace=context-name app_name-7c746d74c6-v7l55 -- bash

~ $ kubectl logs app_name-866784d6bb-snnpd --previous
~ $ kubectl logs app_name-866784d6bb-snnpd



~ $ kubectl scale deploy app_name -n default --replicas=0


~ $ kubectl get deploy app_name -n default
~ $ kubectl get deploy app_name -n context-name
kubectl get deployment -n default

## check pods running in default
~ $ kubectl get deploy app_name -n default

## scale pod to 0 in default
~ $ kubectl scale deploy app_name -n default --replicas=0

## check pods running in context-name
~ $ kubectl get deploy app_name -n context-name
```
