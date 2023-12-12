---
title: Implementing Blue/Green and Canary Deployment Strategies in Kubernetes
date: 2023-11-18 13:34:01
categories: 
  - Kubernetes
  - CKAD
tags: 
  - Kubernetes
  - CKAD
---

## Overview

Learn how to implement blue/green and canary deployment strategies in Kubernetes. These methods enhance stability and reliability when deploying new versions of applications.

!!! note "Key Concepts"
    Blue/Green and Canary deployments are strategies to reduce risks during application updates, allowing gradual and controlled rollouts.

## Blue/Green Deployment

### What is Blue/Green Deployment?

Blue/Green Deployment involves two identical environments: one active (Blue) and one idle (Green). New versions are deployed to Green and, after testing, traffic is switched from Blue to Green.

### Example Blue/Green Setup

**Blue Deployment**:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: blue-deployment
  labels:
    app: bluegreen-test
    color: blue
spec:
  replicas: 1
  selector:
    matchLabels:
      app: bluegreen-test
      color: blue
  template:
    metadata:
      labels:
        app: bluegreen-test
        color: blue
    spec:
      containers:
        - name: nginx
          image: nginx:1.14.2
          ports:
            - containerPort: 80
```

**Green Deployment**:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: green-deployment
  labels:
    app: bluegreen-test
    color: green
spec:
  replicas: 1
  selector:
    matchLabels:
      app: bluegreen-test
      color: green
  template:
    metadata:
      labels:
        app: bluegreen-test
        color: green
    spec:
      containers:
        - name: nginx
          image: nginx:1.15.8
          ports:
            - containerPort: 80
```

**Service to Switch Traffic**:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: bluegreen-test-svc
spec:
  selector:
    app: bluegreen-test
    color: blue  # Change to green to switch traffic
  ports:
    - protocol: TCP
      port: 80
```

!!! tip "Switching Traffic"
    Update the `color` label in the Service from `blue` to `green` to direct traffic to the new version.

## Canary Deployment

### What is Canary Deployment?

Canary Deployment involves rolling out a new version to a small subset of users before deploying it to the entire user base, allowing for gradual and controlled updates.

### Example Canary Setup

**Main Deployment**:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: main-deployment
spec:
  replicas: 5  # Main user base
  template:
    metadata:
      labels:
        app: canary-test
        environment: main
    spec:
      containers:
        - name: nginx
          image: nginx:1.14.2
          ports:
            - containerPort: 80
```

**Canary Deployment**:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: canary-deployment
spec:
  replicas: 1  # Subset of users
  template:
    metadata:
      labels:
        app: canary-test
        environment: canary
    spec:
      containers:
        - name: nginx
          image: nginx:1.15.8
          ports:
            - containerPort: 80
```

**Service to Direct Traffic**:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: canary-test-svc
spec:
  selector:
    app: canary-test
  ports:
    - protocol: TCP
      port: 80
```

!!! tip "Managing Traffic"
    Control user exposure to the new version by adjusting the number of replicas in the canary deployment.

## Conclusion

Blue/Green and Canary deployment strategies in Kubernetes offer a methodical approach to manage application updates, reducing risks and ensuring a smoother rollout process.

---
