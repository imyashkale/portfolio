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

<!-- markdownlint-disable MD033 -->
<figure markdown="span">
  ![CKAD](../../../assets/img/ckad.png){ width="300" }
</figure>

---

### Deploying a Pod with a Sidecar Container

This example demonstrates deploying a multi-container Pod where one container (the sidecar) reads data written by the main container.

```yaml title="multi-pod.yaml"
apiVersion: v1
kind: Pod
metadata:
  name: multi-pod
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

In this deployment, the `writer` container writes data to a shared volume, and the `sidecar` container continuously reads and displays this data from the shared volume.

---

### Deploying a Pod with an Init Container

This example illustrates deploying a Pod with an init container that must complete its task before the main container starts.

```yaml title="init-container.yaml"
apiVersion: v1
kind: Pod
metadata:
  name: init-container
spec:
  containers:
    - name: nginx
      image: nginx:stable
  initContainers:
    - name: busybox
      image: busybox:stable
      command: ['sh', '-c', 'sleep 30']
```

In this setup, the `busybox` init container runs a simple sleep command for 30 seconds. Once this init container completes its execution, the main `nginx` container will start.

---

## Conclusion

These examples can be deployed in your Kubernetes environment. They illustrate the use of sidecar and init containers, offering practical insights into their deployment and functionality in a Kubernetes setting.

---
