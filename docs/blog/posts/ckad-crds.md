---
title: Using Custom Resources (CRD)
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

Custom Resources extend the Kubernetes API. A `CustomResourceDefinition` (CRD) is used to define these custom resources.

#### Example CRD

In this example, we define a `GardenPlant` resource.

```yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: gardenplants.myorg.com
spec:
  group: myorg.com
  names:
    plural: gardenplants
    singular: gardenplant
    kind: GardenPlant
    shortNames:
    - gp
  scope: Namespaced
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
              height:
                type: integer
              color:
                type: string
```

#### Steps to Use CRDs

1. **Create the CRD Definition**
   - Define your custom resource in a YAML file using the structure above.
   - Save this file as `gardenplant-crd.yaml`.

2. **Apply the CRD**
   - Use `kubectl` to create the CRD in your cluster:

    ```
    kubectl apply -f gardenplant-crd.yaml
    ```

3. **Define a Custom Resource**
   - Once the CRD is applied, you can define custom resources based on it. Example:

     ```yaml
     apiVersion: myorg.com/v1
     kind: GardenPlant
     metadata:
       name: my-rose
     spec:
       height: 60
       color: red
     ```

   - Save this as `my-rose.yaml`.

4. **Create the Custom Resource**
   - Apply the custom resource to your cluster:

     ```
     kubectl apply -f my-rose.yaml
     ```

5. **Interact with the Custom Resource**
   - Use standard Kubernetes commands to interact with your custom resource:
     - To get the resource:

       ```
       kubectl get gardenplant
       ```

     - To describe the resource:

       ```
       kubectl describe gardenplant my-rose
       ```

#### Conclusion

Custom Resources in Kubernetes are a powerful way to introduce new API objects tailored to your application's needs, enhancing the flexibility and functionality of your Kubernetes cluster.
