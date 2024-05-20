---
title: Guide to CIS Kubernetes Benchmarking with Kube-bench
icon: material/newspaper-variant-outline
date: 2023-05-20 01:50:00
comments: true
categories:
- Kubernetes
- CKS
tags:
- CKS
- Kubernetes
---

## What is CIS - Center for Internet Security?

The **Center for Internet Security (CIS)** is a non-profit organization that develops globally recognized best practices for securing IT systems and data. CIS provides benchmarks, controls, and guidelines to help organizations improve their cybersecurity posture.

---

## CIS Benchmark for Kubernetes

The **CIS Kubernetes Benchmark** provides a comprehensive set of guidelines for securing Kubernetes clusters. These benchmarks cover various aspects such as configuration, management, and monitoring, aiming to enhance the overall security of Kubernetes deployments.

You can download the CIS Kubernetes Benchmark from the official CIS website: [CIS Kubernetes Benchmark Download](https://www.cisecurity.org/benchmark/kubernetes/){:target="_blank"}.

---

## Introduction to Kube-bench Tool

**Kube-bench** is an open-source tool developed by Aqua Security that automates the process of checking Kubernetes clusters against the CIS Kubernetes Benchmark. It provides a detailed report highlighting which controls are compliant and which need remediation.

---

## Deploy Kube-bench Options

There are multiple ways to deploy Kube-bench in your Kubernetes environment:

- **Running as a Job**: Execute Kube-bench as a Kubernetes job, which runs the checks and exits.
- **Running as a DaemonSet**: Deploy Kube-bench as a DaemonSet to run on every node in the cluster.
- **Running locally**: Run Kube-bench directly on the command line for individual nodes.

- [**Kube-bench Installation**](https://github.com/aquasecurity/kube-bench/blob/main/docs/installation.md){:target="_blank"}

---

## Run Kube-bench

  ```sh
  kube-bench run --benchmark <benchmark-version>
  ```

---

## Fix One Sample Issue

Let's fix an issue identified by Kube-bench:

**Ensure that the --anonymous-auth argument is set to false (CIS 1.2.5)**.

### Steps to Fix

#### 1. **Identify the Configuration File**:

Locate the `kube-apiserver` configuration file, usually found in `/etc/kubernetes/manifests/kube-apiserver.yaml`.

#### 2. **Edit the Configuration**:

Open the `kube-apiserver.yaml` file and add or modify the `--anonymous-auth` flag to be `false`.

```yaml
- --anonymous-auth=false
```

#### 3. **Apply the Changes**

Save the file and the kubelet will automatically restart the `kube-apiserver` with the new settings.

#### 4. **Verify the Fix**

Run Kube-bench again to ensure that the issue is resolved.

```sh
kube-bench run --check 1.2.5
```

---

## Conclusion

Using the CIS Kubernetes Benchmark and Kube-bench tool is a robust approach to enhance the security of your Kubernetes clusters. Regularly running these checks and addressing identified issues helps maintain a secure and compliant environment.
