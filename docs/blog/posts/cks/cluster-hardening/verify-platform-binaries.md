---
title: Verify Kubernetes Plantform Binaries
icon: material/newspaper-variant-outline
date: 2023-04-11 13:03:00
comments: true
categories:
- Kubernetes
- CKS
tags:
- CKS
- Kubernetes
---

## Directory Check and Listing

- Change directory to the location where the binaries are stored.
- List the files in the directory using `ls`

---

## SHA-512 Sum Generation

- Use `sha512sum` to generate the SHA-512 checksum for each binary

    1. `sha512sum kube-apiserver`
    2. `sha512sum kube-controller-manager`
    3. `sha512sum kube-proxy`
    4. `sha512sum kubelet`

---

## Verification

- Compare the generated checksums with the provided ones to ensure they match.
- Identify any discrepancies.

---

## Detailed Comparison for Verification

- For a closer look at the `kube-controller-manager` checksum, redirect the output to a file: `sha512sum kube-controller-manager > compare`
- Open the `compare` file in Vim: `vim compare`
- Edit the file to ensure that each line contains only the checksum value.
- Use `cat` and `uniq` to compare the contents of the `compare` file and ensure that there are no duplicate lines indicating a discrepancy:

     ```bash
     cat compare | uniq
     ```

---

## Cleanup

- Remove the binaries (`kubelet` and `kube-controller-manager`) that showed discrepancies in the checksums: `rm kubelet kube-controller-manager`

This process ensures that the binaries in the Kubernetes cluster match the expected checksums, helping to verify their integrity and authenticity.
