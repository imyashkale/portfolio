---
title: Notes for Network and Services
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

<!-- markdownlint-disable MD033 -->
<figure markdown="span">
  ![CKAD](../../../assets/img/ckad.png){ width="300" }
</figure>

---

#### 1. Introduction to Network Policies in Kubernetes

Network Policies in Kubernetes allow you to control the flow of traffic at the IP address or port level, which is crucial for ensuring that only authorized services can communicate with each other.

#### 2. Understanding Pod Isolation

- **Non-isolated Pods**: By default, pods in Kubernetes can receive traffic from any source. Without any network policies, pods are considered non-isolated.
- **Isolated Pods**: When a pod is selected by a network policy, it becomes isolated, and only traffic allowed by the network policies will be permitted.

#### 3. Creating a Front-end and Back-end Pod

- **Scenario**: We have a front-end web application and a back-end API service. We want to ensure that only the front-end can communicate with the back-end.
- **Front-end Pod**:

     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: frontend-pod
       labels:
         app: frontend
     spec:
       containers:
       - name: frontend-container
         image: nginx
     ```

- **Back-end Pod**:

     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: backend-pod
       labels:
         app: backend
     spec:
       containers:
       - name: backend-container
         image: nodejs
     ```

#### 4. Implementing a Default Deny Network Policy

- **Objective**: Create a default deny policy to ensure that no unauthorized communication occurs.

     ```yaml
     apiVersion: networking.k8s.io/v1
     kind: NetworkPolicy
     metadata:
       name: default-deny-all
       namespace: default
     spec:
       podSelector: {}
       policyTypes:
         - Ingress
     ```

#### 5. Allowing Traffic from Front-end to Back-end

- **Objective**: Allow only the front-end pod to communicate with the back-end pod.

     ```yaml
     apiVersion: networking.k8s.io/v1
     kind: NetworkPolicy
     metadata:
       name: allow-frontend-to-backend
       namespace: default
     spec:
       podSelector:
         matchLabels:
           app: backend
       policyTypes:
         - Ingress
       ingress:
         - from:
             - podSelector:
                 matchLabels:
                   app: frontend
           ports:
             - protocol: TCP
               port: 80
     ```

- **Explanation**: This policy allows ingress traffic to the back-end pod (label `app: backend`) only from the front-end pod (label `app: frontend`).

#### 6. Testing and Verifying Network Policies

- **Testing**: Use `kubectl exec` to simulate traffic from the front-end to the back-end and verify that the traffic is allowed. Attempt to access the back-end from a different pod and observe that the traffic is blocked.

---

#### Summary

  Employing network policies ensures secure communication within your Kubernetes cluster, adhering to the principle of least privilege.

---
