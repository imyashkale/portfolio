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

### 1.1 Managing a Pod

#### Creating a Pod

```bash
kubectl run my-pod --image=nginx:latest --restart=Never --env=VAR1=value1
```

- `--image nginx:latest`: Specifies the container image.
- `--restart Never`: Controls the restart policy.
- `--env VAR1=value1`: Sets environment variables.

**Declarative**:

- Generate YAML:

```bash
kubectl run my-pod --image=nginx:latest --restart=Never --env=VAR1=value1 --dry-run=client -o yaml > my-pod.yaml
```

- Apply YAML:

```bash
kubectl apply -f my-pod.yaml
```

#### Getting Pods

```bash
kubectl get pods -o wide --watch
```

- `-o wide`: Provides more detailed output.
- `--watch`: Watches for changes in real-time.

#### Describing a Pod

```bash
kubectl describe pod my-pod
```

## 2. Deployments

### 2.1 Managing Deployments

#### Creating a Deployment

```bash
kubectl create deployment my-deployment --image=nginx:latest --replicas=2
```

- `--image nginx:latest`: Specifies the container image.
- `--replicas 2`: Number of desired replicas.

**Declarative**:

- Generate YAML:

```bash
kubectl create deployment my-deployment --image=nginx:latest --replicas=2 --dry-run=client -o yaml > my-deployment.yaml
```

- Apply YAML:

```bash
kubectl apply -f my-deployment.yaml
```

#### Scaling a Deployment

```bash
kubectl scale deployment my-deployment --replicas=5
```

- `--replicas 5`: Sets the number of desired replicas.

**Declarative**:

- Update YAML: Adjust `replicas` in `my-deployment.yaml` file.
- Apply YAML:

```bash
kubectl apply -f my-deployment.yaml
```

## 3. Services

### 3.1 Creating a Service

```bash
kubectl expose deployment my-deployment --port=80 --type=ClusterIP
```

- `--port 80`: Specifies the port number.
- `--type ClusterIP`: Defines the type of service.

**Declarative**:

- Generate YAML:

```bash
kubectl expose deployment my-deployment --port=80 --type=ClusterIP --dry-run=client -o yaml > my-service.yaml
```

- Apply YAML:

```bash
kubectl apply -f my-service.yaml
```

## 4. Namespaces

### 4.1 Managing Namespaces

#### Creating a Namespace

```bash
kubectl create namespace my-namespace
```

**Declarative**:

- Generate YAML:

```bash
kubectl create namespace my-namespace --dry-run=client -o yaml > my-namespace.yaml
```

- Apply YAML:

```bash
kubectl apply -f my-namespace.yaml
```

#### Listing Namespaces

```bash
kubectl get namespaces
```

## 5. Configuration

### 5.1 Managing ConfigMaps and Secrets

#### Creating a ConfigMap

```bash
kubectl create configmap my-configmap --from-literal=key1=value1 --from-file=./config-file.txt
```

- `--from-literal key1=value1`: Sets a key-value pair directly.
- `--from-file ./config-file.txt`: Creates a ConfigMap from a file.

**Declarative**:

- Generate YAML:

```bash
kubectl create configmap my-configmap --from-literal=key1=value1 --from-file=./config-file.txt --dry-run=client -o yaml > my-configmap.yaml
```

-

 Apply YAML:

```bash
kubectl apply -f my-configmap.yaml
```

#### Creating a Secret

```bash
kubectl create secret generic my-secret --from-literal=key1=value1 --from-file=./secret-file.txt
```

- `--from-literal key1=value1`: Sets a key-value pair for the secret.
- `--from-file ./secret-file.txt`: Creates a Secret from a file.

**Declarative**:

- Generate YAML:

```bash
kubectl create secret generic my-secret --from-literal=key1=value1 --from-file=./secret-file.txt --dry-run=client -o yaml > my-secret.yaml
```

- Apply YAML:

```bash
kubectl apply -f my-secret.yaml
```

## 6. Monitoring and Logging

### 6.1 Getting Logs

```bash
kubectl logs my-pod -f --since=1h
```

- `-f`: Follow log output in real-time.
- `--since 1h`: Show logs since a certain time.

## 7. Jobs and CronJobs

### 7.1 Managing Jobs and CronJobs

#### Creating a Job

```bash
kubectl create job my-job --image=busybox
```

- `--image busybox`: Specifies the container image.

**Declarative**:

- Generate YAML:

```bash
kubectl create job my-job --image=busybox --dry-run=client -o yaml > my-job.yaml
```

- Apply YAML:

```bash
kubectl apply -f my-job.yaml
```

#### Creating a CronJob

```bash
kubectl create cronjob my-cronjob --schedule="*/5 * * * *" --image=busybox
```

- `--schedule "*/5 * * * *"`: Sets the cron schedule in cron format.

**Declarative**:

- Generate YAML:

```bash
kubectl create cronjob my-cronjob --schedule="*/5 * * * *" --image=busybox --dry-run=client -o yaml > my-cronjob.yaml
```

- Apply YAML:

```bash
kubectl apply -f my-cronjob.yaml
```

## 8. Rolling Updates and Rollbacks

### 8.1 Managing Updates and Rollbacks

#### Updating a Deployment

```bash
kubectl set image deployment/my-deployment nginx=nginx:1.9.1
```

**Declarative**:

- Update YAML: Adjust `image` in `my-deployment.yaml`.
- Apply YAML:

```bash
kubectl apply -f my-deployment.yaml
```

#### Rolling Back a Deployment

```bash
kubectl rollout undo deployment/my-deployment
```

**Declarative**:

- Use previous version of `my-deployment.yaml`.
- Apply YAML:

```bash
kubectl apply -f my-deployment.yaml
```

## 9. Resource Management

### 9.1 Setting Resource Requests and Limits

```bash
kubectl set resources deployment/my-deployment --limits=cpu=200m,memory=512Mi --requests=cpu=100m,memory=256Mi
```

- `--limits cpu=200m,memory=512Mi` and `--requests cpu=100m,memory=256Mi`: Set resource constraints.

**Declarative**:

- Update YAML: Adjust `resources` in `my-deployment.yaml`.
- Apply YAML:

```bash
kubectl apply -f my-deployment.yaml
```

## 10. Debugging

### 10.1 Diagnosing and Fixing Issues

#### Executing into a Container

```bash
kubectl exec -it my-pod -- /bin/bash
```

**Declarative**: Not applicable for exec command.

#### Port Forwarding

```bash
kubectl port-forward my-pod 8080:80
```

- `8080:80`: Forwards local port 8080 to the Pod's port 80.

**Declarative**: Not applicable for port-forward command.

#### Copying Files to/from a Container

```bash
kubectl cp /path/on/local/file.txt my-pod:/path/in/container/file.txt
```

**Declarative**: Not applicable for cp command.

## 11. Labels and Selectors

### 11.1 Managing Labels

#### Adding Labels to a Pod

```bash
kubectl label pods my-pod key1=value1 key2=value2
```

- Adds labels `key1=value1` and `key2=value2` to `my-pod`.

#### Updating Labels of a Pod

```bash
kubectl label pods my-pod key1=value1 --overwrite
```

- Updates the value of `key1` to `value1` on `my-pod`, overwriting if it exists.

#### Removing Labels from a Pod

```bash
kubectl label pods my-pod key1-
```

- Removes the label `key1` from `my-pod`.

#### Filtering Resources by Labels

```bash
kubectl get pods -l key1=value1,key2=value2
```

- Lists all pods with labels `key1=value1` and `key2=value2`.

#### Using Labels for Resource Management

- **Imperative**:
  - Assigning a label:

  ```bash
  kubectl label pods my-pod env=dev
  ```

  - Selecting resources:

  ```bash
  kubectl get pods -l env=dev
  ```

- **Declarative**:
  - Update YAML: Add labels under `metadata.labels` in resource definition files.
  - Apply YAML:

  ```bash
  kubectl apply -f <resource-definition-file>.yaml
  ```
