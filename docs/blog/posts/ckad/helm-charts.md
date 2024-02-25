---
title: Deploying and Managing MySQL with Helm in Kubernetes
date: 2023-11-16 13:34:01
comments: true
categories: 
  - Kubernetes
  - CKAD
tags: 
  - Kubernetes
  - CKAD
---

<!-- markdownlint-disable MD033 -->
<figure markdown="span">
  ![CKAD](../../../assets/img/ckad.png){ width="300" }
</figure>

## Overview

This guide explains how to deploy and manage the MySQL database using Helm in a Kubernetes environment. Helm, a package manager for Kubernetes, simplifies the process of managing Kubernetes applications.

!!! note
    For detailed Helm installation instructions, refer to [Installing Helm](https://helm.sh/docs/intro/install/). Helm Charts package all the resource definitions necessary to deploy an application in Kubernetes.

## Deploying MySQL with Helm

Helm streamlines the deployment of applications in Kubernetes, and here’s how you can use it to deploy MySQL:

### 1. Add a Helm Repository

First, add the Bitnami Helm repository which contains the MySQL chart:

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

### 2. Update the Repository

Ensure you have the latest charts by updating the repository:

```bash
helm repo update
```

### 3. Install MySQL Chart

Replace `$MYSQL_ROOT_PASSWORD` with your desired root password.

```bash title="Example"
export MYSQL_ROOT_PASSWORD=strong-password
```

To install the MySQL chart with a custom password:

```bash
helm install --set mysqlRootPassword=$MYSQL_ROOT_PASSWORD --set volumePermissions.enabled=true -n my-database my-mysql bitnami/mysql
```

The `volumePermissions.enabled=true` setting helps avoid potential permission issues with persistent volumes.

!!! tip
    Use `helm search repo [repository-name]` to find available charts in a repository.

### 4. Intentionally Update to an Incompatible MySQL Image Tag

To simulate a real-world problem where an update might cause issues, let's intentionally update to an incompatible MySQL image tag:

```bash
helm upgrade my-mysql bitnami/mysql -n my-database --set image.tag=nonexistent
```

!!! info
    The purpose of this command is to simulate a problematic update, allowing us to demonstrate the rollback process. This update intentionally uses a non-existent tag, which will cause the update to fail, resembling a common real-world issue.

## Managing MySQL with Helm

### 5. Viewing Helm Release History

To view the history of the MySQL release:

```bash
helm history my-mysql -n my-database
```

### 6. Listing Installed Helm Charts

List all installed Helm charts in a specific namespace:

```bash
helm list -n my-database
```

### 7. Rolling Back a Helm Release

To rollback to the first version of the MySQL release:

```bash
helm rollback my-mysql 1 -n my-database
```

!!! caution
    Rollbacks cannot be undone. Be sure of the revision number.

### 8. Uninstalling the MySQL Release

To remove the MySQL release:

```bash
helm uninstall my-mysql -n my-database
```

## Conclusion

Using Helm to deploy and manage applications like MySQL in Kubernetes simplifies the process considerably. Following these steps, including addressing common deployment challenges like permission issues, will allow you to effectively manage MySQL in your Kubernetes clusters.

---
