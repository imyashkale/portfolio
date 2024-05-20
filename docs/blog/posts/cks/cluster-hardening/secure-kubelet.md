---
title: Securing Kubelet - A Guide for CKS
icon: material/newspaper-variant-outline
date: 2023-05-20 03:13:00
comments: true
categories:
- Kubernetes
- CKS
tags:
- CKS
- Kubernetes
---

## Introduction

The **Certified Kubernetes Security Specialist (CKS)** exam requires a deep understanding of securing the Kubelet, the primary "node agent" in Kubernetes. This guide covers key aspects of securing the Kubelet, including configuration, authentication, and best practices.

---

## Kubelet Configuration File

The Kubelet's behavior is configured via a configuration file, typically found at:

- **Linux**: `/var/lib/kubelet/config.yaml`
- **Windows**: `C:\var\lib\kubelet\config.yaml`

---

### Viewing the Configuration

To view the contents of the Kubelet configuration file, use:

```sh
cat /var/lib/kubelet/config.yaml
```

---

## Viewing Kubelet Options

To see all available configuration options for the Kubelet, use:

```sh
kubelet --help
```

This command displays all command-line flags and options that can be used to configure the Kubelet.

---

## Kubelet Serving Ports and Their Functions

The Kubelet uses several ports for different functions:

- **10250**: Main Kubelet API port for communication with the Kubernetes API server.
- **10255**: Read-only port for health checks and metrics (deprecated and should be disabled).

### Example Kubelet Configuration

```yaml
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
authentication:
  anonymous:
    enabled: false
  webhook:
    enabled: true
  x509:
    clientCAFile: /etc/kubernetes/pki/ca.crt
authorization:
  mode: Webhook
port: 10250
readOnlyPort: 0
```

---

## Enable/Disable Anonymous Authentication in Kubelet

Anonymous authentication allows unauthenticated requests to access the Kubelet's API. For security, it is recommended to disable this feature.

### Disabling Anonymous Authentication

To disable anonymous authentication, ensure the following configuration is set:

```yaml
authentication:
  anonymous:
    enabled: false
```

### Enabling Anonymous Authentication

If necessary, you can enable anonymous authentication by setting:

```yaml
authentication:
  anonymous:
    enabled: true
```

After modifying the configuration file, restart the Kubelet to apply the changes:

```sh
sudo systemctl restart kubelet
```

---

## Kubelet Authentication: Certificates and API Bearer Tokens

Kubelet supports multiple authentication methods to secure communication with the Kubernetes API server and other components.

### Certificate-Based Authentication

Configure the Kubelet to use client certificates for authentication:

```yaml
authentication:
  x509:
    clientCAFile: /etc/kubernetes/pki/ca.crt
```

### API Bearer Token Authentication

Configure the Kubelet to use API bearer tokens for authentication:

```yaml
authentication:
  webhook:
    enabled: true
  token:
    enabled: true
```

### Example Configuration with Authentication

```yaml
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
authentication:
  anonymous:
    enabled: false
  webhook:
    enabled: true
  x509:
    clientCAFile: /etc/kubernetes/pki/ca.crt
authorization:
  mode: Webhook
serverTLSBootstrap: true
port: 10250
readOnlyPort: 0
```

---

## Best Practices for Securing Kubelet

1. **Disable Read-Only Port**: Ensure the read-only port (10255) is disabled.
2. **Enable Webhook Authorization**: Use webhook authorization to enforce fine-grained access control.
3. **Use TLS**: Always use TLS for secure communication.
4. **Rotate Certificates Regularly**: Implement a process to rotate Kubelet certificates regularly.
5. **Restrict Node Access**: Limit access to nodes and the Kubelet API to trusted sources only.

---

By following these practices, you can enhance the security of the Kubelet and maintain a secure Kubernetes environment, essential for passing the CKS exam and ensuring robust cluster security.
