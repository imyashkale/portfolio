---
title: Creating and Managing ConfigMaps and Secrets in Kubernetes
icon: material/newspaper-variant-outline
date: 2023-12-07 13:34:01
categories:
  - Kubernetes
  - CKAD
tags:
  - CKAD
  - Kubernetes
---

#### ConfigMaps

ConfigMaps store non-sensitive configuration data that can be passed to containers in key-value pairs.

1. **Creating a ConfigMap**
   - Define a ConfigMap with desired data.
   - Example:

     ```yaml
     apiVersion: v1
     kind: ConfigMap
     metadata:
       name: app-config
     data:
       database_url: "http://mydb.example.com:3306"
       feature_flag: "true"
     ```

2. **Using ConfigMap as Environment Variables**
   - Reference the ConfigMap in a Pod to set environment variables.
   - Example:

     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: app-pod
     spec:
       containers:
       - name: app-container
         image: myapp:latest
         env:
         - name: DATABASE_URL
           valueFrom:
             configMapKeyRef:
               name: app-config
               key: database_url
         - name: FEATURE_FLAG
           valueFrom:
             configMapKeyRef:
               name: app-config
               key: feature_flag
     ```

3. **Using ConfigMap as Volume Mounts**
   - Mount the entire ConfigMap as a volume.
   - Example:

     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: app-pod
     spec:
       containers:
       - name: app-container
         image: myapp:latest
         volumeMounts:
         - name: config-volume
           mountPath: /etc/config
       volumes:
       - name: config-volume
         configMap:
           name: app-config
     ```

#### Secrets

Secrets are used to store and manage sensitive data, such as passwords or tokens.

1. **Creating a Secret**
   - Define a Secret with base64 encoded values.
   - Example:

     ```yaml
     apiVersion: v1
     kind: Secret
     metadata:
       name: app-secret
     type: Opaque
     data:
       db_password: "c2VjcmV0cGFzc3dvcmQ="  # 'secretPassword' encoded
     ```

2. **Using Secrets as Environment Variables**
   - Inject Secrets into a container as environment variables.
   - Example:

     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: secret-app-pod
     spec:
       containers:
       - name: secret-app-container
         image: myapp:latest
         env:
         - name: DB_PASSWORD
           valueFrom:
             secretKeyRef:
               name: app-secret
               key: db_password
     ```

3. **Using Secrets as Volume Mounts**
   - Mount Secrets as volumes in a container.
   - Example:

     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: secret-app-pod
     spec:
       containers:
       - name: secret-app-container
         image: myapp:latest
         volumeMounts:
         - name: secret-volume
           mountPath: /etc/secret
       volumes:
       - name: secret-volume
         secret:
           secretName: app-secret
     ```

#### Conclusion

Using ConfigMaps and Secrets in Kubernetes provides flexibility in managing configuration and sensitive data. They can be efficiently used either as environment variables for direct access by the application or mounted as volumes for situations where file-based configuration is needed. This approach improves security and maintainability of containerized applications【64†source】.
