---
title: Deploy a multi-container Pod using sidecar or init container patterns.
icon: material/newspaper-variant-outline
date: 2023-12-12 10:00:01
comments: true
categories:
- Kubernetes
- CKAD
tags:
- CKAD
- Kubernetes

---

### Example 1: Deploying a Pod with a Sidecar Container

This example demonstrates deploying a multi-container Pod where one container (the sidecar) reads data written by the main container.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: sidecar-test
spec:
  containers:
    - name: writer
      image: busybox:stable
      command: ['sh', '-c', 'echo "The writer wrote this!" > /output/data.txt; while true; do sleep 5; done']
      volumeMounts:
        - name: shared
          mountPath: /output
    - name: sidecar
      image: busybox:stable
      command: ['sh', '-c', 'while true; do cat /input/data.txt; sleep 5; done']
      volumeMounts:
        - name: shared
          mountPath: /input
  volumes:
    - name: shared
      emptyDir: {}
```

In this deployment, the `writer` container writes data to a shared volume, and the `sidecar` container continuously reads and displays this data from the shared volume【28†source】.

### Example 2: Deploying a Pod with an Init Container

This example illustrates deploying a Pod with an init container that must complete its task before the main container starts.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: init-test
spec:
  containers:
    - name: nginx
      image: nginx:stable
  initContainers:
    - name: busybox
      image: busybox:stable
      command: ['sh', '-c', 'sleep 60']
```

In this setup, the `busybox` init container runs a simple sleep command for 60 seconds. Once this init container completes its execution, the main `nginx` container will start【29†source】.

These examples can be deployed in your Kubernetes environment using `kubectl apply -f <filename>.yaml`. They illustrate the use of sidecar and init containers, offering practical insights into their deployment and functionality in a Kubernetes setting.
