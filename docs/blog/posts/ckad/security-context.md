---
title: Apply SecurityContexts to Enforce Security Policies in Pods
icon: material/newspaper-variant-outline
date: 2023-12-07 10:00:01
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

---

#### Overview

SecurityContexts in Kubernetes allow you to enforce security policies in Pods. They enable you to control permissions, privilege levels, and other security settings for Pods and their containers.

!!! info "Documentation"
    [Configure a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/){:target="_blank"}.

---

#### Security Context

Here's an example of a Pod with a defined SecurityContext, as found in the Kubernetes documentation:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: security-context-demo
spec:
  securityContext:
    runAsUser: 1000
    fsGroup: 2000
  containers:
  - name: sec-ctx-demo
    image: busybox
    command: ["sh", "-c", "sleep 1h"]
    securityContext:
      runAsUser: 2000
      capabilities:
        add: ["NET_ADMIN", "SYS_TIME"]
      readOnlyRootFilesystem: true
```

#### Steps to Apply SecurityContexts

1. **Define the SecurityContext**

      Include the SecurityContext in your Pod YAML file, as shown in the example.

2. **Apply the SecurityContext**

      Save the YAML file with a name like `security-context-demo.yaml`.
      Deploy it to your cluster using `kubectl apply -f security-context-demo.yaml`.

3. **Verify Security Settings**

      Confirm the enforcement of security settings by inspecting the running Pod:
      Use commands like `kubectl exec` to examine process permissions and filesystem access.

---

#### Conclusion

SecurityContexts are essential for maintaining security in Kubernetes Pods. They provide granular control over security aspects such as user identity, privilege levels, and filesystem access, thus enhancing the overall security posture of Kubernetes applications.

---
