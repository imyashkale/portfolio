---
title: Implementing and Configuring Liveness and Readiness Probes in Kubernetes
icon: material/newspaper-variant-outline
date: 2023-12-07 13:34:01
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

#### Overview

Liveness and readiness probes are crucial for maintaining the health and efficiency of applications in Kubernetes, implemented using HTTP requests or command executions within the container.

!!! info "Documentation"
    [Configure Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/){:target="_blank"}.

---

#### Implementing HTTP Get Probes

1. Liveness Probe with HTTP Get

    Ensures the `nginx` container is alive. Restarts the container upon probe failure.

    ```yaml
    livenessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 3
      periodSeconds: 3
    ```

    [HTTP Get Probes Documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#http-probes){:target="_blank"}.

2. **Readiness Probe with HTTP Get**

    Assesses if the container is ready to accept traffic.

    ```yaml
    readinessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 15
      periodSeconds: 5
    ```

    [Readiness Probes Documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#http-probes){:target="_blank"}.

---

#### Implementing Command-Based Probes

Command-based probes are another method to determine container status:

1. **Liveness Probe with Command**

    Executes a command inside the container, restarting it upon failure.

    ```yaml
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 15
      periodSeconds: 20
    ```

    [Command Probes Documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-command-liveness-probe){:target="_blank"}.

2. **Readiness Probe with Command**

    Checks container readiness through a command execution.

    ```yaml
    readinessProbe:
      exec:
        command:
        - cat
        - /tmp/ready
      initialDelaySeconds: 5
      periodSeconds: 10
    ```

    [Command Probes Documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-command-liveness-probe){:target="_blank"}.

---

#### Example Pod Configuration

Here's an example of a Pod using both HTTP Get and Command probes:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: probe-pod
spec:
  containers:
  - name: nginx-container
    image: nginx:1.20.1
    ports:
    - containerPort: 80
    livenessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 3
      periodSeconds: 3
    readinessProbe:
      exec:
        command:
        - cat
        - /usr/share/nginx/html/index.html
      initialDelaySeconds: 5
      periodSeconds: 10
```

In this configuration, the `nginx` container employs an HTTP Get liveness probe and a command-based readiness probe verifying the `index.html` file's presence.

---

#### Conclusion

Effectively utilizing liveness and readiness probes in Kubernetes is vital for ensuring applications run correctly and are prepared for traffic. These probes enable Kubernetes to manage containers based on real-time status, boosting application reliability and availability.

---
