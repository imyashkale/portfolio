---

title: Monitoring Applications in Kubernetes with kubectl top
icon: material/newspaper-variant-outline
date: 2023-12-07 23:00:00
comments: true
categories:
- Kubernetes
- CKAD
tags:
- CKAD
- Kubernetes
---

#### Overview

Monitoring resource usage in Kubernetes clusters is crucial for ensuring the efficient operation of applications. The Kubernetes CLI tool `kubectl top` provides real-time views into the resource usage of nodes and pods in the cluster.

#### Installing Metrics Server

Before using `kubectl top`, you need to have the Metrics Server installed in your Kubernetes cluster. The Metrics Server collects resource metrics from Kubelets and exposes them via the Kubernetes API server for use by tools like `kubectl top`.

1 **Install Metrics Server**

- You can install the Metrics Server using `kubectl` with the following command:

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

- This command deploys the Metrics Server in the `kube-system` namespace.

2 **Verify Installation**

- Ensure that the Metrics Server has been deployed successfully:

```bash
kubectl get deployment metrics-server -n kube-system
```

!!! info "Documentation"
    For more detailed information and configuration options, visit [Metrics Server on GitHub](https://github.com/kubernetes-sigs/metrics-server).

#### Understanding kubectl top

`kubectl top` displays the current CPU and memory usage for nodes or pods, fetching data from the Metrics Server.

#### Monitoring Pod Resource Usage

To view the resource usage of pods, use:

```bash
kubectl top pod
```

This lists all pods in the default namespace with their CPU and memory usage.

#### Specifying Namespaces

Specify a different namespace using the `-n` flag:

```bash
kubectl top pod -n [namespace]
```

#### Monitoring Node Resource Usage

To view resource usage across nodes:

```bash
kubectl top node
```

#### Best Practices for Monitoring

1. Regularly check resource usage to prevent issues.
2. Use `kubectl top` alongside other monitoring tools.
3. Monitor both pods and nodes for overall health.

#### Conclusion

`kubectl top` is an essential tool for real-time monitoring of resource usage in Kubernetes. With the Metrics Server installed, it becomes a powerful asset for maintaining the health and efficiency of your Kubernetes cluster.

---
