---
title: Performing Rolling Updates in Kubernetes Deployments
date: 2023-12-07 10:18:01
comments: true
categories: 
  - Kubernetes
  - CKAD
tags: 
  - Kubernetes
  - CKAD
---

<!-- markdownlint-disable MD033 -->
<figure markdown="span">
  ![CKAD](../../../assets/img/ckad.png){ width="300" }
</figure>

## Overview

Learn how to perform rolling updates in Kubernetes Deployments, allowing for zero-downtime updates. This guide outlines the steps for updating a Deployment while ensuring continuous service availability.

!!! note
    Before proceeding, ensure you have a basic understanding of Kubernetes Deployments and Services. Visit [Kubernetes Documentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) for more information.

## Steps for a Rolling Update

Rolling updates replace old Pods with new ones, seamlessly updating your application without downtime.

### 1. Initiate the Rolling Update

Start by updating the Deployment's pod template, typically by changing the image version.

Example:

```bash
kubectl set image deployment.v1.apps/my-deployment nginx=nginx:1.16.1
```

### 2. Monitor the Rollout

Check the status of the update to ensure it's progressing correctly.

```bash
kubectl rollout status deployment/my-deployment
```

### 3. Undo the Update if Needed

If problems arise during the update, you can revert to the previous state.

```bash
kubectl rollout undo deployment/my-deployment
```

!!! tip
    Always test updates in a staging environment and monitor the deployment closely during the rollout. Be prepared to rollback if any issues are detected.

## Conclusion

Rolling updates in Kubernetes provide a robust mechanism for updating applications without service interruption. By following these steps, you can maintain high availability while deploying new versions or configurations.

---
