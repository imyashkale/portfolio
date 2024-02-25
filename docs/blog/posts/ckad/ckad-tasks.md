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
- [Build and modify container images using Docker commands.](build-container.md){:target="_blank"}
- [Deploy a multi-container Pod using sidecar or init container patterns.](multi-container.md){:target="_blank"}
- [Work with persistent and ephemeral volumes in Pods.](volumes.md){:target="_blank"}

---

## Application Deployment (20%)

- [Implement a blue/green or canary deployment strategy.](blue-green-canary-deployment.md){:target="_blank"}
- [Perform rolling updates on a Deployment.](rolling-updates.md){:target="_blank"}
- [Deploy an application using a Helm chart.](helm-charts.md){:target="_blank"}
- [Modify an application deployment using Kustomize.](kustomize.md){:target="_blank"}

---

## Application Observability and Maintenance (15%)

- [Address API deprecations in application code or configurations.](api-deprecations.md){:target="_blank"}
- [Implement and configure liveness and readiness probes.](liveness-readiness.md){:target="_blank"}
- [Monitor applications using Kubernetes CLI tools like `kubectl top`.](monitoring-applications.md){:target="_blank"}
- [Access and analyze container logs.](container-logs.md){:target="_blank"}
- [Debug common issues in a Kubernetes application.](debug-common-issues.md){:target="_blank"}

---

## Application Environment, Configuration, and Security (25%)

- [Utilize CustomResourceDefinitions (CRDs) and Kubernetes Operators.](crds.md){:target="_blank"}
- [Configure ServiceAccounts for application Pods.](service-accounts.md){:target="_blank"}
- [Manage Kubernetes authentication, authorization](kubernetes-auth.md){:target="_blank"}
- [Admission control processes.](admission-control.md){:target="_blank"}
- [Set up resource requests, limits, and quotas in Pod definitions.](compute-resource-usage.md){:target="_blank"}
- [Create and manage ConfigMaps and Secrets.](configmaps-secrets.md){:target="_blank"}
- [Apply SecurityContexts to enforce security policies in Pods.](security-context.md){:target="_blank"}

---

## Services and Networking (20%)

- [Implement NetworkPolicies for fine-grained network control.](network-policy.md){:target="_blank"}
- [Configure and troubleshoot access to applications through Services.](services.md){:target="_blank"}  
- [Set up Ingress rules to expose applications to external traffic.](ingress.md){:target="_blank"}  

---
