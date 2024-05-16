---
title: Certificate API
icon: material/newspaper-variant-outline
date: 2023-05-16 09:00:00
comments: true
categories:
- Kubernetes
- CKS
tags:
- CKS
- Kubernetes
---

!!! info Documentation
    [Certificates and Certificate Signing Requests](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/){:target="_blank"}

---
Overview of what a Certificate Signing Request (CSR).

1. **Request for Certificate**: A CSR is a request sent to a Certificate Authority (CA) asking for a digital certificate.
  
2. **Contains Public Key**: It includes the applicant's public key along with identity information (e.g., common name, organization details).

3. **Signed by Private Key**: The CSR is signed by the applicant's private key to prove ownership and authenticity of the public key.

4. **Establishes Trust**: By submitting a CSR, the applicant seeks validation of their identity by the CA to establish trust.

5. **Enables Secure Communications**: Once approved, the CA issues a digital certificate that binds the applicant's identity to their public key, enabling secure encrypted communications (e.g., HTTPS, SSL/TLS connections).

---

#### 1. Create a CSR

- First, generate a private key and CSR using OpenSSL:

  ```bash
  openssl genrsa -out my-key.key 2048
  openssl req -new -key my-key.key -out my-csr.csr -subj "/CN=my-user"
  ```

- Encode CSR in Base64
  Encode the CSR in base64 (to be included in the YAML):

  ```bash
  cat my-csr.csr | base64 | tr -d '\n'
  ```

- Next, create a Kubernetes CSR manifest (`my-csr.yaml`):

  ```yaml
  apiVersion: certificates.k8s.io/v1
  kind: CertificateSigningRequest
  metadata:
    name: my-csr
  spec:
    request: <encoded-base64-goes-here>
    signerName: kubernetes.io/kube-apiserver-client
    usages:
    - client auth
  ```

- Apply the CSR manifest:

  ```bash
  kubectl apply -f my-csr.yaml
  ```

#### 2. Approve or Deny the CSR

- To approve the CSR:

  ```bash
  kubectl certificate approve my-csr
  ```

- To deny the CSR:

  ```bash
  kubectl certificate deny my-csr
  ```

#### 3. List CSRs

- List all CertificateSigningRequests:

  ```bash
  kubectl get csr
  ```

#### 4. View YAML and Describe CSR

- View the CSR in YAML format:

  ```bash
  kubectl get csr my-csr -o yaml
  ```

- Describe the CSR:

  ```bash
  kubectl describe csr my-csr
  ```

#### 5. Delete the CSR

  ```bash
  kubectl delete csr my-csr
  ```

---

### Locating Certificates on the Master Node

Once a CSR is approved, the certificate will typically be signed by the Kubernetes Certificate Authority and returned. To locate certificates:

- Certificates are generally stored in etcd and are not directly accessible from the file system. However, if you are managing custom certificates, they may be stored in specific directories like `/etc/kubernetes/pki`.

- For cluster components (e.g., kube-apiserver, kubelet), certificates are usually stored in `/etc/kubernetes/pki` on the master node.

- Example locations:
  - CA certificates: `/etc/kubernetes/pki/ca.crt`
  - API server certificates: `/etc/kubernetes/pki/apiserver.crt`
  - Kubelet certificates: `/var/lib/kubelet/pki/kubelet-client-current.pem`

#### Accessing the Master Node

- SSH into the master node:

  ```bash
  ssh user@master-node-ip
  ```

- Navigate to the directory containing certificates:

  ```bash
  cd /etc/kubernetes/pki
  ```

- List the files to see the certificates:

  ```bash
  ls -l
  ```

---

### Additional Tips

- Ensure you have appropriate permissions to manage CSRs and access the file system on the master node.
- Regularly back up your certificate files and maintain secure practices around certificate management.
- Refer to the Kubernetes documentation for detailed information on the CSR API and certificate management best practices.

By following these steps, you should be able to create, manage, and locate certificates effectively in a Kubernetes cluster, which is essential for your CKS certification preparation.
