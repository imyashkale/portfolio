---
title: Exploring Admission Control in Kubernetes
icon: material/newspaper-variant-outline
date: 2023-12-07 13:34:01
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---
#### Overview

Admission Control in Kubernetes refers to a set of plugins that intercept requests to the Kubernetes API server after authentication and authorization. These plugins can modify or validate requests to the API server, ensuring compliance with specific policies or enhancing security.

#### Admission Control Plugins

There are several admission control plugins available in Kubernetes, each serving a specific purpose. Some common plugins include:

- **NamespaceLifecycle**: Ensures that requests for a particular namespace are allowed only if the namespace exists.
- **LimitRanger**: Enforces limits on the amount of resources that can be requested by a Pod.
- **ServiceAccount**: Automates the provisioning of ServiceAccounts.
- **NodeRestriction**: Limits the Node and Pod objects a kubelet can modify.
- **PodSecurityPolicy**: Controls security-sensitive aspects of the pod specification.
- **ResourceQuota**: Enforces quotas on the resources a namespace can use.

#### Steps to Configure Admission Control

1. **Identify Required Plugins**
   - Determine which admission control plugins are necessary for your specific requirements.

2. **Configure kube-apiserver**
   - Admission control plugins are enabled in the kube-apiserver configuration.
   - Locate the kube-apiserver manifest, typically at `/etc/kubernetes/manifests/kube-apiserver.yaml`.
   - Add the `--enable-admission-plugins` flag with a comma-separated list of plugins. Example:

     ```
     --enable-admission-plugins=NamespaceLifecycle,LimitRanger,ServiceAccount
     ```

3. **Restart kube-apiserver**
   - After modifying the kube-apiserver manifest, the kube-apiserver process needs to be restarted. This is usually handled automatically by Kubernetes when the manifest file is updated.

4. **Verify Plugin Activation**
   - Ensure that the plugins are active and working as expected. This can be done by observing the API server logs or by testing the functionality of the plugins.

#### Conclusion

Admission Control is a powerful mechanism in Kubernetes for enforcing policies and enhancing the security of the cluster. Properly configuring admission control plugins can help maintain cluster stability and compliance with organizational standards. It is important to understand the implications of each plugin and configure them according to the specific needs of your Kubernetes environment.
