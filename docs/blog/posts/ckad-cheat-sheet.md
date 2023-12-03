---
title: CKAD kubectl Cheat Sheet
icon: material/newspaper-variant-outline
date: 2023-11-18 13:34:01
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---

## 0. Context Management

Switching and Managing Kubernetes Contexts

### 0.1 View Current Context

```bash
kubectl config current-context
```

### 0.2 List All Contexts

```bash
kubectl config get-contexts
```

### 0.3 Switch Context

```bash
kubectl config use-context my-context
```

- `my-context`: Name of the context to switch to.

## 1. Pods

Creating and Managing Pods

### 1.1 Create a Pod

```bash
kubectl run my-pod --image=nginx:latest --restart=Never --env=VAR1=value1
```

- `--image nginx:latest`: Specifies the container image.
- `--restart Never`: Controls the restart policy, `Never` for a Pod.
- `--env VAR1=value1`: Sets environment variables.

### 1.2 Get Pods

```bash
kubectl get pods -o wide --watch
```

- `-o wide`: Provides more detailed output.
- `--watch`: Watches for changes in real-time.

### 1.3 Describe a Pod

```bash
kubectl describe pod my-pod
```

Provides detailed information about the Pod.

## 2. Deployments

Deploying and Updating Applications

### 2.1 Create a Deployment

```bash
kubectl create deployment my-deployment --image=nginx:latest --replicas=2
```

- `--image nginx:latest`: Specifies the container image.
- `--replicas 2`: Number of desired replicas.

### 2.2 Scale a Deployment

```bash
kubectl scale deployment my-deployment --replicas=5
```

- `--replicas 5`: Sets the number of desired replicas.

## 3. Services

Exposing Applications

### 3.1 Create a ClusterIP Service

```bash
kubectl expose deployment my-deployment --port=80 --type=ClusterIP
```

- `--port 80`: Specifies the port number.
- `--type ClusterIP`: Defines the type of service.

## 4. Namespaces

Namespace Management

### 4.1 Create a Namespace

```bash
kubectl create namespace my-namespace
```

### 4.2 List Namespaces

```bash
kubectl get namespaces
```

## 5. Configuration

ConfigMaps and Secrets

### 5.1 Create a ConfigMap

```bash
kubectl create configmap my-configmap --from-literal=key1=value1 --from-file=./config-file.txt
```

- `--from-literal key1=value1`: Sets a key-value pair directly.
- `--from-file ./config-file.txt`: Creates a ConfigMap from a file.

## 6. Monitoring and Logging

Observing Pod and Node Behavior

### 6.1 Get Logs

```bash
kubectl logs my-pod -f --since=1h
```

- `-f`: Follow log output in real-time.
- `--since 1h`: Show logs since a certain time.

## 7. Jobs and CronJobs

Running Tasks

### 7.1 Create a Job

```bash
kubectl create job my-job --image=busybox
```

- `--image busybox`: Specifies the container image.

### 7.2 Create a CronJob

```bash
kubectl create cronjob my-cronjob --schedule="*/5 * * * *" --image=busybox
```

- `--schedule "*/5 * * * *"`: Sets the cron schedule in cron format.

## 8. Rolling Updates and Rollbacks

Managing Application Updates

### 8.1 Update a Deployment

```bash
kubectl set image deployment/my-deployment nginx=nginx:1.9.1
```

Updates the image of the deployment.

### 8.2 Rollback a Deployment

```bash
kubectl rollout undo deployment/my-deployment
```

Undoes the most recent rollout.

## 9. Resource Management

Configuring Compute Resources

### 9.1 Set Resource Requests and Limits

```bash
kubectl set resources deployment/my-deployment --limits=cpu=200m,memory=512Mi --requests=cpu=100m,memory=256Mi
```

- `--limits cpu=200m,memory=512Mi` and `--requests cpu=100m,memory=256Mi`: Set resource constraints.

## 10. Debugging

Diagnosing and Fixing Issues

### 10.1 Exec into a Container

```bash
kubectl exec -it my-pod -- /bin/bash
```

Opens a shell inside the container.

### 10.3 Port Forwarding

```bash
kubectl port-forward my-pod 8080:80
```

- `8080:80`: Forwards local port 8080 to the Pod's port 80.

### 10.4 Copy Files to/from a Container

```bash
kubectl cp /path/on/local/file.txt my-pod:/path/in/container/file.txt
```

Copies a file from the local filesystem to a container.