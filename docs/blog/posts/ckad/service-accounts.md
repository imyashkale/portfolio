---

title: Using ServiceAccounts in Kubernetes
icon: material/newspaper-variant-outline
date: 2023-12-07 10:00:01
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---

#### Overview

ServiceAccounts in Kubernetes provide identities for processes running in Pods, enabling them to authenticate with the Kubernetes API server.

!!! info "Documentation"
    [Kubernetes Service Accounts](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/){:target="_blank"}.

#### Example ServiceAccount Creation

Here's how to create a ServiceAccount:

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-serviceaccount
automountServiceAccountToken: true
```

#### Steps to Create and Use ServiceAccounts

1 **Create the ServiceAccount**

- Define your ServiceAccount in a YAML file as shown above.
- Save this file as `my-serviceaccount.yaml`.
- Apply it with `kubectl apply -f my-serviceaccount.yaml`.

2 **Assign the ServiceAccount to a Pod**

- Specify the ServiceAccount in the Pod's specification. Example:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  serviceAccountName: my-serviceaccount
  containers:
  - name: my-container
    image: nginx
```

- Save this as `my-pod.yaml` and apply it with `kubectl apply -f my-pod.yaml`.

3 **Location of the Mounted Token**

- The ServiceAccount token is automatically mounted at `/var/run/secrets/kubernetes.io/serviceaccount` in each container.
- This directory contains:
  - `token`: The ServiceAccount token.
  - `ca.crt`: Certificate for TLS communication with the API server.
  - `namespace`: The namespace of the Pod.

4 **Using the Token for API Authentication**

- Applications in the container can use the token for Kubernetes API server authentication.
- The token can be accessed at `/var/run/secrets/kubernetes.io/serviceaccount/token`.

#### Example: Accessing the Kubernetes API from a Pod

Here’s how a container might use the token to communicate with the Kubernetes API:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: api-communicator-pod
spec:
  serviceAccountName: my-serviceaccount
  containers:
  - name: api-communicator
    image: busybox  
    command: ["sh", "-c", "curl -H \"Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)\" https://kubernetes.default.svc"]
```

#### Conclusion

ServiceAccounts in Kubernetes facilitate the secure operation of processes within Pods by providing a means of authenticating with the Kubernetes API server. The automatic mounting of ServiceAccount tokens into Pods simplifies the process of managing secure communications and access controls within a Kubernetes environment.

---
