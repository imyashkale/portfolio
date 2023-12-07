---
title: Deploying Applications with Helm Charts in Kubernetes
date: 2023-11-18 13:34:01
categories: 
  - Kubernetes
  - CKAD
tags: 
  - Kubernetes
  - CKAD
---

## Overview

Deploying applications in Kubernetes can be simplified using Helm, a package manager for Kubernetes. This post guides you through deploying an application using a Helm chart.

!!! note
    For detailed Helm installation instructions, refer to [Installing Helm](https://helm.sh/docs/intro/install/). Helm Charts package all the resource definitions needed to deploy an application in Kubernetes.

## Deploying an Application with Helm

Helm simplifies Kubernetes application deployment by packaging all necessary resources in a chart. Here’s how to deploy an application using Helm:

### 1. Add a Helm Repository

First, add a Helm repository. Repositories contain collections of charts.

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

### 2. Update the Repository

Update the repository to ensure you have the latest charts.

```bash
helm repo update
```

### 3. Install a Chart

Choose and install a chart from the repository. For example, to install a DokuWiki chart from the Bitnami repository:

```bash
helm install --set persistence.enabled=false -n dokuwiki dokuwiki bitnami/dokuwiki
```

This command installs DokuWiki, a wiki software, with disabled persistence and in the namespace `dokuwiki`.

!!! tip
    Use `helm search repo [repository-name]` to find available charts in a repository. Customize the installation with `--set` to alter chart configurations.

## Conclusion

Helm charts streamline the deployment of applications in Kubernetes, bundling all the necessary Kubernetes resources. By following these steps, you can efficiently deploy and manage applications across your Kubernetes clusters.
