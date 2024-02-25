---
title: Certified Kubernetes Application Developer (CKAD) Exam Tasks
icon: material/newspaper-variant-outline
date: 2023-12-07 10:00:01
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

## Application Design and Build (20%)

- [Create a Dockerfile for a new application.](dockerize-app.md){:target="_blank"}
- [Build and modify container images using Docker commands.](build-container.md)
- [Deploy a multi-container Pod using sidecar or init container patterns.](multi-container.md)
- [Work with persistent and ephemeral volumes in Pods.](volumes.md)

---

## Application Deployment (20%)

- [Implement a blue/green or canary deployment strategy.](blue-green-canary-deployment.md)
- [Perform rolling updates on a Deployment.](rolling-updates.md)
- [Deploy an application using a Helm chart.](helm-charts.md)
- [Modify an application deployment using Kustomize.](kustomize.md)

---

## Application Observability and Maintenance (15%)

- [Address API deprecations in application code or configurations.](api-deprecations.md)
- [Implement and configure liveness and readiness probes.](liveness-readiness.md)
- [Monitor applications using Kubernetes CLI tools like `kubectl top`.](monitoring-applications.md)
- [Access and analyze container logs.](container-logs.md)
- [Debug common issues in a Kubernetes application.](debug-common-issues.md)

---

## Application Environment, Configuration, and Security (25%)

- [Utilize CustomResourceDefinitions (CRDs) and Kubernetes Operators.](crds.md)
- [Configure ServiceAccounts for application Pods.](service-accounts.md)
- [Manage Kubernetes authentication, authorization](kubernetes-auth.md)
- [Admission control processes.](admission-control.md)
- [Set up resource requests, limits, and quotas in Pod definitions.](compute-resource-usage.md)
- [Create and manage ConfigMaps and Secrets.](configmaps-secrets.md)
- [Apply SecurityContexts to enforce security policies in Pods.](security-context.md)

---

## Services and Networking (20%)

- [Implement NetworkPolicies for fine-grained network control.](network-policy.md)  
- [Configure and troubleshoot access to applications through Services.](services.md)  
- [Set up Ingress rules to expose applications to external traffic.](ingress.md)  

---
