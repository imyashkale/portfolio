---
title: Modifying Application Deployments with Kustomize in Kubernetes
date: 2023-11-18 13:34:01
categories: 
  - Kubernetes
  - CKAD
tags: 
  - Kubernetes
  - CKAD
---

## Overview

Kustomize is a powerful tool in Kubernetes for customizing application deployments. It allows you to modify and manage configurations without altering the original YAML files. This post covers how to use Kustomize to modify a Kubernetes deployment.

!!! note
    Kustomize is built into `kubectl` as of version 1.14. Ensure your Kubernetes setup is updated.

## Using Kustomize to Modify Deployments

Kustomize lets you manage Kubernetes objects with a declarative approach. It's particularly useful for handling ConfigMaps and Secrets.

### Example: Modifying a ConfigMap

A ConfigMap in Kubernetes stores non-confidential data in key-value pairs. It can be used to store configuration files and environment variables.

1 **Create a ConfigMap**

Here's an example ConfigMap:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
    name: my-configmap
data:
    message: "Hello World!"
    app.cfg: |
    # A configuration file!
    key1=value1
    key2=value2
```

2 **Reference the ConfigMap in a Pod**

Pods can use ConfigMaps as environment variables or mounted volumes.

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: cm-pod
spec:
    restartPolicy: Never
    containers:
    - name: busybox
        image: busybox:stable
        # Reference ConfigMap here
```

3 **Use Kustomize to Modify the ConfigMap**

With Kustomize, you can create an overlay that changes the values in the ConfigMap without modifying the original file.

- Create a `kustomization.yaml` file that specifies the modifications.
- Apply the changes using `kubectl apply -k`.

!!! tip
    Kustomize can be used to manage a variety of Kubernetes resources, including Deployments, Services, and more. It's a versatile tool for customizing and managing your Kubernetes applications.

## Conclusion

Kustomize offers a flexible way to manage Kubernetes applications' configurations. By using Kustomize, you can easily modify deployments, keeping your configurations consistent and manageable.
