---
title: CKA Official Docs   
icon: material/newspaper-variant-outline
date: 2023-02-22 18:43:00
comments: true
categories:
- Kubernetes
- CKA
tags:
- CKA
- Kubernetes

---

1. Cluster Architecture, Installation & Configuration – 25%
2. Services & Networking – 20%
3. Troubleshooting – 30%
4. Workloads & Scheduling – 15%
5. Storage – 10%

### 1. Cluster Architecture, Installation & Configuration – 25%

- [Manage role based access control (RBAC)](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
- [Use Kube-adm to install a basic cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
- [Manage a highly-available Kubernetes cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/)
- [Provision underlying infrastructure to deploy a Kubernetes cluster](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Perform a version upgrade on a Kubernetes cluster using Kubeadm](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
- [Implement etcd backup and restore](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster)

### 2. Services & Networking – 20%

- [Understand host networking configuration on the cluster nodes](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
- [Understand connectivity between Pods](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
- [Understand ClusterIP, NodePort, LoadBalancer service types and endpoints](https://kubernetes.io/docs/concepts/services-networking/service/)
- [Know how to use Ingress controllers and Ingress resources](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Know how to configure and use CoreDNS](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
- [Choose an appropriate container network interface plugin](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/)

### 3. Troubleshooting – 30%

- [Evaluate cluster and node logging](https://kubernetes.io/blog/2015/06/cluster-level-logging-with-kubernetes/)
- [Understand how to monitor applications](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
- [Manage container stdout & stderr logs](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
- [Troubleshoot application failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/)
- [Troubleshoot cluster component failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
- [Troubleshoot networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/)

### 4. Workloads & Scheduling – 15%

- [Understand deployments and how to perform rolling update and rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#rolling-back-a-deployment)
- [Use ConfigMaps and Secrets to configure applications](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap)
- [Know how to scale applications](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment)
- [Understand the primitives used to create robust, self-healing, application deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#use-case)
- [Understand how resource limits can affect Pod scheduling](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
- [Awareness of manifest management and common templating tools](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/)

### 5. Storage – 10%

- [Understand storage classes, persistent volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistent-volumes)
- [Understand volume mode, access modes and reclaim policies for volumes](https://kubernetes.io/docs/tasks/administer-cluster/change-pv-reclaim-policy/)
- [Understand persistent volume claims primitive](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)
- [Know how to configure applications with persistent storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim)
