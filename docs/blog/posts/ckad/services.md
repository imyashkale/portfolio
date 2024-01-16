---
title: Kubernetes Services with Pod Creation
icon: material/newspaper-variant-outline
date: 2023-12-06 21:34:01
comments: true
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---

#### 1. Introduction to Kubernetes Services

- **Purpose**: Kubernetes Services allow for the exposure of applications running on Pods, both within the cluster and externally.
- **Types of Services**: Includes ClusterIP for internal exposure and NodePort for external exposure.

#### 2. Creating a Sample Application Pod

- **Objective**: Deploy a simple web application pod to demonstrate service exposure.
- **Pod YAML Example**:

     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: web-app-pod
       labels:
         app: web-app
     spec:
       containers:
       - name: nginx-container
         image: nginx
     ```

- **Explanation**: This creates a pod named `web-app-pod` with an Nginx container, labeled `app: web-app`, which we will expose using Services.

#### 3. Exposing the Pod with a ClusterIP Service

- **Objective**: Expose the `web-app-pod` within the cluster.
- **Service YAML Example**:

     ```yaml
     apiVersion: v1
     kind: Service
     metadata:
       name: clusterip-web-service
     spec:
       type: ClusterIP
       selector:
         app: web-app
       ports:
         - protocol: TCP
           port: 8081
           targetPort: 80
     ```

- **Explanation**: The `clusterip-web-service` exposes the `web-app-pod` inside the cluster on TCP port 8081.

#### 4. Exposing the Pod with a NodePort Service

- **Objective**: Expose the `web-app-pod` externally, outside the Kubernetes cluster.
- **Service YAML Example**:

     ```yaml
     apiVersion: v1
     kind: Service
     metadata:
       name: nodeport-web-service
     spec:
       type: NodePort
       selector:
         app: web-app
       ports:
         - protocol: TCP
           port: 8082
           targetPort: 80
           nodePort: 30081
     ```

- **Explanation**: The `nodeport-web-service` makes the pod accessible externally on TCP port 30081 on each node in the cluster.

#### 5. Verifying Service Exposure

- **ClusterIP Verification**: Use `kubectl exec` to access the `web-app-pod` from another pod within the cluster using the ClusterIP service.
- **NodePort Verification**: Access the `web-app-pod` externally using `<NodeIP>:30081`, where `NodeIP` is the IP address of any node in the cluster.

#### 6. Summary

- **Effective Use of Services**: Understanding how to expose pods using ClusterIP and NodePort services is essential for application accessibility in Kubernetes.
