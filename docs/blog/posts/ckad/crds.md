---
title: Using Custom Resources (CRD)
icon: material/newspaper-variant-outline
date: 2023-12-07 10:00:01
comments: true
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---

<!-- markdownlint-disable MD033 -->
<figure markdown="span">
  ![CKAD](../../../assets/img/ckad.png){ width="300" }
</figure>

#### Overview

Custom Resources extend the Kubernetes API. A `CustomResourceDefinition` (CRD) is used to define these custom resources.

!!! info "Documentation"
    [Extend the Kubernetes API with CustomResourceDefinitions](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/){:target="_blank"}.

#### Example CRD

In this example, we define a `CronTab` resource as described in the Kubernetes documentation.

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: crontabs.stable.example.com
spec:
  group: stable.example.com
  versions:
    - name: v1
      served: true
      storage: true
      schema:
        openAPIV3Schema:
          type: object
          properties:
            spec:
              type: object
              properties:
                cronSpec:
                  type: string
                image:
                  type: string
                replicas:
                  type: integer
  scope: Namespaced
  names:
    plural: crontabs
    singular: crontab
    kind: CronTab
    shortNames:
    - ct
```

#### Steps to Use CRDs

1 **Create the CRD Definition**

- Define your custom resource in a YAML file using the structure above.
- Save this file as `crontab-crd.yaml`.

2 **Apply the CRD**

- Use `kubectl` to create the CRD in your cluster:

```bash
kubectl apply -f crontab-crd.yaml
```

3 **Define a Custom Resource**

- Once the CRD is applied, you can define custom resources based on it. Example:

```yaml
apiVersion: "stable.example.com/v1"
kind: CronTab
metadata:
  name: my-new-cron-object
spec:
  cronSpec: "* * * * */5"
  image: my-awesome-cron-image
  replicas: 1
```

- Save this as `my-new-cron-object.yaml`.

4 **Create the Custom Resource**

- Apply the custom resource to your cluster:

```bash
kubectl apply -f my-new-cron-object.yaml
```

5 **Interact with the Custom Resource**

- Use standard Kubernetes commands to interact with your custom resource:
  - To get the resource:

    ```bash
    kubectl get crontab
    ```

  - To describe the resource:

    ```bash
    kubectl describe crontab my-new-cron-object
    ```

#### Conclusion

Custom Resources in Kubernetes are a powerful way to introduce new API objects tailored to your application's needs, enhancing the flexibility and functionality of your Kubernetes cluster.

<https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/>

---
