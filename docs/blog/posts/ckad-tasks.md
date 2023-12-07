---
title: Certified Kubernetes Application Developer (CKAD) Exam Tasks
icon: material/newspaper-variant-outline
date: 2023-12-07 10:00:01
categories:
- Kubernetes
- CKAD
tags:
- CKAD
- Kubernetes

---

## Application Design and Build (20%)

### Tasks

- Create a Dockerfile for a new application.
- Build and modify container images using Docker commands.
- Deploy a multi-container Pod using sidecar or init container patterns.
- Work with persistent and ephemeral volumes in Pods.

## Application Deployment (20%)

### Tasks

- Implement a blue/green or canary deployment strategy.
- Perform rolling updates on a Deployment.
- Deploy an application using a Helm chart.
- Modify an application deployment using Kustomize.

## Application Observability and Maintenance (15%)

### Tasks

- Address API deprecations in application code or configurations.
- Implement and configure liveness and readiness probes.
- Monitor applications using Kubernetes CLI tools like `kubectl top`.
- Access and analyze container logs.
- Debug common issues in a Kubernetes application.

## Application Environment, Configuration, and Security (25%)

### Tasks

- [Utilize CustomResourceDefinitions (CRDs) and Kubernetes Operators.](ckad-crds.md)
- [Manage Kubernetes authentication, authorization](ckad-kubernetes-auth.md)
- [Admission control processes.](ckad-admission-control.md)
- [Set up resource requests, limits, and quotas in Pod definitions.](ckad-compute-resource-usage.md)
- [Create and manage ConfigMaps and Secrets.](ckad-configmaps-secrets.md)
- [Configure ServiceAccounts for application Pods.](ckad-service-accounts.md)
- Apply SecurityContexts to enforce security policies in Pods.

## Services and Networking (20%)

### Tasks

- [Implement NetworkPolicies for fine-grained network control.](ckad-network-policy.md)  
- [Configure and troubleshoot access to applications through Services.](ckad-services.md)  
- [Set up Ingress rules to expose applications to external traffic.](ckad-ingress.md)  
