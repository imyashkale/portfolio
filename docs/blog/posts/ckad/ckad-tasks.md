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

- [Address API deprecations in application code or configurations.](api-deprecations.md)
- [Implement and configure liveness and readiness probes.](liveness-readiness.md)
- Monitor applications using Kubernetes CLI tools like `kubectl top`.
- [Access and analyze container logs.](container-logs.md)
- Debug common issues in a Kubernetes application.]

## Application Environment, Configuration, and Security (25%)

### Tasks

- [Utilize CustomResourceDefinitions (CRDs) and Kubernetes Operators.](crds.md)
- [Configure ServiceAccounts for application Pods.](service-accounts.md)
- [Manage Kubernetes authentication, authorization](kubernetes-auth.md)
- [Admission control processes.](admission-control.md)
- [Set up resource requests, limits, and quotas in Pod definitions.](compute-resource-usage.md)
- [Create and manage ConfigMaps and Secrets.](configmaps-secrets.md)
- [Apply SecurityContexts to enforce security policies in Pods.](security-context.md)

## Services and Networking (20%)

### Tasks

- [Implement NetworkPolicies for fine-grained network control.](network-policy.md)  
- [Configure and troubleshoot access to applications through Services.](services.md)  
- [Set up Ingress rules to expose applications to external traffic.](ingress.md)  
