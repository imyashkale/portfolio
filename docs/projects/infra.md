---
title: Infra - Infrastructure for Bare Metal Kubernetes Cluster Using Terraform on AWS EC2
date: 2023-12-25 11:34:00
description: 
tags:
  - Go
  - Microservices
---

## Project Overview

'Infra' is a meticulously crafted project that focuses on creating the infrastructure necessary for a bare metal Kubernetes cluster using Terraform on AWS EC2. This initiative showcases a sophisticated blend of infrastructure automation and the practical application of container orchestration in a bare metal context.

---

## GitHub Repository

Explore more about the project at [Infra on GitHub](https://github.com/imyashkale/infra).

---

## Terraform Variables

### **Region (`region`)**

- **Description:** Sets the AWS region for deploying resources.
- **Default Value:** "ap-south-1"
- **Purpose:** To establish the geographical location for resource deployment, optimizing performance and adhering to data residency requirements.

### **AMI (`ami`)**

- **Description:** Specifies the Amazon Machine Image for EC2 instances.
- **Default Value:** "ami-03f4878755434977f" (Ubuntu 22.04 LTS AMI)
- **Purpose:** Ensures consistency and compatibility of EC2 instances using a specific Ubuntu version.

### **Key Name (`key_name`)**

- **Description:** Names the key pair for EC2 instances.
- **Default Value:** "mackbook-pro"
- **Purpose:** Facilitates secure SSH access to EC2 instances.

### **Local Key Path (`local_key_path`)**

- **Description:** Local path to the key file.
- **Default Value:** "~/mackbook-pro.pem"
- **Purpose:** Specifies the location of the private key for secure connections to EC2 instances.

---

## Terraform Outputs

### **Master Node SSH (`master-node-ssh`)**

- **Description:** SSH command for the master node.
- **Value:** `ssh -i [local_key_path] ubuntu@[master-node public IP]`
- **Purpose:** Provides an easy-to-use SSH command for accessing the master node, incorporating the local key path and the node's public IP.

### **Worker Node SSH (`worker-node-ssh`)**

- **Description:** SSH command for the worker node.
- **Value:** `ssh -i [local_key_path] ubuntu@[worker-node public IP]`
- **Purpose:** Offers a convenient command for securely managing the worker node, essential for cluster operations.

---
