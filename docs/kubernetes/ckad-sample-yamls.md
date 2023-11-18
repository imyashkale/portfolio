---
tags:
  - Kubernetes
  - CKAD
---
# Essential Kubernetes YAML Samples for CKAD Exam

---

## 1. Pod

A basic Pod definition running an Nginx container.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx
    image: nginx:latest
```

- `apiVersion`: The version of the API to use.
- `kind`: The kind of object (here, Pod).
- `metadata`: Metadata about the resource.
- `name`: The name of the Pod.
- `spec`: Specification of the Pod.
- `containers`: List of containers to run in the Pod.
- `name`: Name of the container.
- `image`: Docker image to use for the container.

## 2. Deployment

A Deployment managing an Nginx application with a set number of replicas.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
```

- `replicas`: Number of desired pod instances.
- `selector`: Label selector for managing the pods.
- `template`: Template for creating the pods.
- `labels`: Key-value pairs used for organizing and selecting objects.

## 3. Service

A ClusterIP Service to expose the Nginx Deployment within the cluster.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: ClusterIP
  selector:
    app: nginx
  ports:
  - port: 80
    targetPort: 80
```

- `type`: The type of Service (ClusterIP, NodePort, or LoadBalancer).
- `selector`: Selects the pods to which this service routes traffic.
- `ports`: Ports through which the service is exposed.

## 4. ConfigMap

A ConfigMap for passing configuration data to pods.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  config.json: |
    {
      "key": "value"
    }
```

- `data`: The configuration data.

## 5. Secret

A Secret for storing sensitive data like passwords.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  password: cGFzc3dvcmQ=
```

- `type`: The type of Secret.
- `data`: The data stored in the Secret, base64 encoded.

## 6. PersistentVolumeClaim

A claim for storage resources defined in a PersistentVolume.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

- `accessModes`: Defines how the volume can be mounted.
- `resources`: The requested storage resources.

## 7. Ingress

An Ingress for routing external traffic to internal services.

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80
```

- `rules`: Defines how traffic is routed to the services.
- `paths`: The paths that the Ingress controller should manage.
- `backend`: Specifies the backend service and port.

---

These YAML examples and explanations cover the key attributes for each Kubernetes object, which are crucial for understanding and managing resources for the CKAD exam.