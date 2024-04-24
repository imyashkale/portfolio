---
title: GitOps Principles
icon: material/newspaper-variant-outline
date: 2023-12-22 09:10:00
comments: true
categories:
  - GitOps
tags:
  - GitOps
---

GitOps is indeed a relatively new approach to software delivery that emphasizes using Git repositories as the source of truth for infrastructure and application deployment. Here's a summary of the key principles and how GitOps pipelines differ from traditional CI/CD pipelines:

---
  
### Declarative

Infrastructure and application configuration are defined declaratively in Git using tools like Kubernetes, Docker, and Terraform.

### Versioned and Immutable

Everything, including code, config, monitoring, and policy, is stored in version control and described in code. Changes are made through Git and everything is managed from a central Git repository.

### Pulled Automatically

Changes to the desired state are automatically applied to the system without manual intervention. This is done programmatically, ensuring that the actual state matches the desired state.

### Continuously Reconciled

Software agents continuously monitor the state of systems. When there's a deviation from the desired state, agents take actions to bring the system back to the desired state.

---

## GitOps Pipelines vs. Traditional CI/CD

### Traditional CI/CD

Combines code assembly, testing, and delivery in a single workflow that completes with deployment to a target environment. This is a push-mode pipeline where the CI/CD system deploys ready containers directly to a cluster.

### GitOps Pipeline

Uses a pull-mode based system with a controller inside a cluster to check infrastructure repositories against changes and implement them with each new commit.  

Git is the key element, serving as the single source of truth for code, configuration, and the full stack.

CI services, code assembling, and testing are necessary to create deployable artifacts, but the overall delivery process is coordinated by the automated deployment system triggered by repository updates.

---

In summary, GitOps simplifies the management of infrastructure by making everything declarative, versioned, and automated. It promotes the use of Git as the source of truth, ensuring that changes are tracked, reviewed, and applied automatically, leading to more reliable and consistent deployments.
