---
title: Detailed Guide on Kubernetes Ingress
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

#### 1. Introduction to Kubernetes Ingress

- **Purpose**: Kubernetes Ingress manages external access to applications running within the cluster.
- **Functionality**: It routes traffic to one or more Kubernetes Services and can offer additional features like SSL termination.

#### 2. Understanding Ingress in Kubernetes

- **Ingress vs. Service**: While Services provide internal routing, Ingress allows external traffic to reach the appropriate Services.
- **Ingress Controller**: Essential for implementing the Ingress functionality. The choice of controller affects how the Ingress behaves and is configured.

#### 3. Creating a NodePort Service for Ingress

- **Objective**: Set up a NodePort Service that the Ingress will route external traffic to.
- **Service YAML Example**:

     ```yaml
     apiVersion: v1
     kind: Service
     metadata:
       name: service-for-ingress
     spec:
       type: NodePort
       selector:
         app: web-app
       ports:
         - protocol: TCP
           port: 8080
           targetPort: 80
           nodePort: 30080
     ```

- **Explanation**: This Service, `service-for-ingress`, is exposed externally on port 30080 and routes traffic to pods labeled `app: web-app`.

#### 4. Defining an Ingress to Expose the Service

- **Objective**: Expose the `service-for-ingress` externally using an Ingress.
- **Ingress YAML Example**:

     ```yaml
     apiVersion: networking.k8s.io/v1
     kind: Ingress
     metadata:
       name: example-ingress
     spec:
       rules:
         - http:
             paths:
               - path: /
                 pathType: Prefix
                 backend:
                   service:
                     name: service-for-ingress
                     port:
                       number: 8080
     ```

- **Explanation**: The `example-ingress` directs external HTTP traffic to the `service-for-ingress` at the specified path `/`.

#### 5. Verifying Ingress Functionality

- **Testing Access**: Use external HTTP requests to the Ingress to ensure it routes traffic correctly to the `service-for-ingress`.
- **SSL Termination (Optional)**: Configure SSL termination on the Ingress for secure traffic (if applicable).

#### 6. Summary

- **Effective Use of Ingress**: Understanding how to configure and use Ingresses is crucial for managing external access to applications in Kubernetes.

