---
title: Managing Compute Resource Usage in Kubernetes
icon: material/newspaper-variant-outline
date: 2023-12-07 13:34:01
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---

#### Overview

Effective management of compute resources in Kubernetes involves setting resource requests and limits for containers and defining ResourceQuotas for namespaces.

#### Resource Requests and Limits

1. **Resource Requests**
   - They inform the Kubernetes scheduler about the minimum resources (CPU and memory) required for a container.
   - The scheduler uses this information to decide which node has enough resources to run the Pod.
   - Example: Setting a request for 0.5 CPU cores and 256MiB of memory.

2. **Resource Limits**
   - They set the maximum amount of resources a container can use.
   - If the container attempts to exceed these limits, it might be terminated or its CPU usage throttled.
   - Example: Setting a limit of 1 CPU core and 512MiB of memory.

#### ResourceQuota

ResourceQuotas are used to limit resource consumption in a specific namespace. They ensure that the resource usage is evenly spread across all applications and that no single application can consume all available resources.

- Example: Setting a quota that limits a namespace to use a maximum of 2 CPU cores and 1GiB of memory.

#### Steps to Implement

1. **Define Resource Requests and Limits**
   - In the Pod specification, include `resources` block under each container to specify requests and limits.
   - Example:

     ```yaml
     resources:
       requests:
         memory: "256Mi"
         cpu: "500m"
       limits:
         memory: "512Mi"
         cpu: "1"
     ```

2. **Create and Apply a ResourceQuota**
   - Define a `ResourceQuota` in a YAML file and apply it to a namespace to enforce limits on the aggregate resource usage.
   - Example:

     ```yaml
     apiVersion: v1
     kind: ResourceQuota
     metadata:
       name: test-quota
       namespace: test-namespace
     spec:
       hard:
         requests.cpu: "2"
         requests.memory: 1Gi
         limits.cpu: "4"
         limits.memory: 2Gi
     ```

3. **Apply the Configurations**
   - Use `kubectl apply -f <filename.yaml>` to create or update your Pods and ResourceQuotas.

#### Conclusion

Managing compute resources effectively is key to maintaining the health and efficiency of a Kubernetes cluster. By properly setting resource requests, limits, and quotas, administrators can ensure that applications perform optimally while avoiding resource starvation or overutilization【56†source】.
