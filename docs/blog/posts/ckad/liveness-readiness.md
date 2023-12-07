---

title: Implementing and Configuring Liveness and Readiness Probes in Kubernetes
icon: material/newspaper-variant-outline
date: 2023-12-07 13:34:01
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---

#### Overview

Liveness and readiness probes are essential for maintaining the health and efficiency of applications in Kubernetes. They can be implemented using HTTP requests or command executions inside the container.

!!! info "Documentation"
    [Configure Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/){:target="_blank"}.

#### Implementing HTTP Get Probes

1 **Liveness Probe with HTTP Get**

- Checks if the `nginx` container is alive. If the probe fails, the container is restarted.

    ```yaml
    livenessProbe:
    httpGet:
        path: /
        port: 80
    initialDelaySeconds: 3
    periodSeconds: 3
    ```

2 **Readiness Probe with HTTP Get**

- Ensures the container is ready to accept traffic.

    ```yaml
    readinessProbe:
    httpGet:
        path: /
        port: 80
    initialDelaySeconds: 15
    periodSeconds: 5
    ```

#### Implementing Command-Based Probes

In addition to HTTP probes, Kubernetes allows configuring probes that execute a command inside the container:

1 **Liveness Probe with Command**

- Executes a command inside the container. The container is restarted if the command fails.

    ```yaml
    livenessProbe:
    exec:
        command:
        - cat
        - /tmp/healthy
    initialDelaySeconds: 15
    periodSeconds: 20
    ```

2 **Readiness Probe with Command**

- Determines if the container is ready to serve traffic by executing a command.

    ```yaml
    readinessProbe:
    exec:
        command:
        - cat
        - /tmp/ready
    initialDelaySeconds: 5
    periodSeconds: 10
    ```

#### Example Pod Configuration

Here's a realistic example of a Pod using both HTTP Get and Command probes:

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

In this configuration, the `nginx` container uses an HTTP Get liveness probe and a command-based readiness probe that checks for the existence of the `index.html` file.

#### Conclusion

Effectively using liveness and readiness probes in Kubernetes is crucial for ensuring that applications are running correctly and are ready to handle traffic. These probes help Kubernetes manage containers based on their real-time status, enhancing application reliability and availability.

---
