---
title: Scanning Images with Trivy.
icon: material/newspaper-variant-outline
date: 2024-05-20 08:55:00
comments: true
categories:
- Kubernetes
- CKS
tags:
- CKS
- Kubernetes
---

## Introduction

Trivy is an open-source security scanner that detects vulnerabilities in container images, file systems, and Git repositories. It identifies security issues in both operating system packages and application dependencies within the container. By using a regularly updated vulnerability database, Trivy helps ensure that containers are secure and compliant with security best practices.

---

## Commands

Trivy commands specifically related to image scanning that are useful for the CKS exam:

### Basic Image Scan

  ```sh
  trivy image <image_name>
  ```

  Scans a specified container image for vulnerabilities.

### Output and Formatting

- **Output in JSON Format**:

  ```sh
  trivy image -f json -o results.json <image_name>
  ```

  Scans the image and outputs the results in JSON format to a file.

- **Output in Table Format**:

  ```sh
  trivy image -f table <image_name>
  ```

  Scans the image and outputs the results in a table format (default format).

### Severity Filtering

- **Filter by Severity**:

  ```sh
  trivy image --severity HIGH,CRITICAL <image_name>
  ```

  Scans the image and reports only high and critical severity vulnerabilities.

### Cache Management

- **Clear Cache**:

  ```sh
  trivy image --clear-cache
  ```

  Clears the local cache used by Trivy before scanning the image.

### Ignoring Specific Vulnerabilities

- **Ignore Specific Vulnerabilities**:

  ```sh
  trivy image --ignorefile .trivyignore <image_name>
  ```

  Uses a `.trivyignore` file to specify vulnerabilities to ignore during scanning.

### Advanced Options

- **Timeout Setting**:

  ```sh
  trivy image --timeout 5m <image_name>
  ```

  Sets a timeout for the scanning process.

- **Ignore Unfixed Vulnerabilities**:

  ```sh
  trivy image --ignore-unfixed <image_name>
  ```

  Ignores vulnerabilities that do not have a fix yet.

- **Skip Update**:

  ```sh
  trivy image --skip-update <image_name>
  ```

  Skips updating the vulnerability database before scanning.

### Comprehensive Scan with All Details

  ```sh
  trivy image --severity HIGH,CRITICAL --ignore-unfixed --skip-update -f json -o results.json <image_name>
  ```

  A comprehensive scan that filters by severity, ignores unfixed vulnerabilities, skips database update, and outputs results in JSON format to a file.

---

These commands allow you to perform detailed and customizable scans on container images, ensuring you can identify and manage vulnerabilities.
