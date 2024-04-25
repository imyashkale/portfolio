---
title: Kubernetes Infrastructure
date: 2023-12-25 11:34:00
comments: true
tags:
  - AWS
  - Terraform
  - Kubernetes
---

#### Introduction

I will introduce the various Infrastructure as Code (IaC) projects I've worked on. These projects utilize Terraform to manage AWS infrastructure and Kubernetes to deploy applications.

## Featured Projects

<!-- markdownlint-disable MD033 -->
<div class="grid cards" markdown>

- :fontawesome-brands-aws:{ .lg .middle } __Terraform AWS VPC__{ .card }

    ---

    The Terraform AWS VPC project sets up a Virtual Private Cloud (VPC) on AWS. It defines the networking components such as subnets, route tables, and internet gateways.
    <br>
    This project is the foundation for hosting applications in a secure and isolated environment.

    [:octicons-arrow-right-24: Explore Repo](https://github.com/imyashkale/terraform-aws-vpc){:target="_blank"}

- :fontawesome-brands-aws:{ .lg .middle } __Terraform AWS EKS__

    ---

    The Terraform AWS EKS project deploys an Amazon Elastic Kubernetes Service (EKS) cluster on top of the previously created VPC.
    <br>
    EKS simplifies the process of running Kubernetes on AWS, providing scalability and high availability for containerized applications.

    [:octicons-arrow-right-24: Explore Repo](https://github.com/imyashkale/terraform-aws-eks){:target="_blank"}

- :fontawesome-brands-aws:{ .lg .middle } __Terraform Kubernetes Infrastructure__

    ---

    The Terraform Kubernetes Infrastructure project extends the EKS cluster by deploying additional Kubernetes resources. 
    <br>
    These include an Application Load Balancer (ALB) for external access, ArgoCD for GitOps-style continuous delivery, and ExternalDNS for managing DNS records.

    [:octicons-arrow-right-24: Explore Repo](https://github.com/imyashkale/terraform-k8s-infrastructure){:target="_blank"}

- :fontawesome-brands-golang:{ .lg .middle } __Application Kubernetes Configurations__

    ---

    The Homepage Application Kubernetes Configurations project contains the Kubernetes manifests for deploying the homepage application.
    <br>
    These configurations define how the application should run within the Kubernetes cluster, including pods, services, and ingresses.

    [:octicons-arrow-right-24: Explore Repo](https://github.com/imyashkale/homepage-k8s-configs){:target="_blank"}

- :fontawesome-brands-golang:{ .lg .middle } __Homepage - Go Application project__

    ---

    The Homepage Application project is a sample application that showcases my skills as a developer.
    <br>
    It can be deployed using the Kubernetes configurations provided in the previous project.

    [:octicons-arrow-right-24: Explore Repo](https://github.com/imyashkale/homepage){:target="_blank"}

</div>

---

## Conclusion

These projects demonstrate my expertise in Infrastructure as Code, AWS, Kubernetes, and software development. They showcase my ability to architect, deploy, and manage modern cloud-native applications. I am continuously learning and improving these projects to stay current with the latest technologies and best practices.
