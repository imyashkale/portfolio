---
title: URLify Hub - Microservices-Driven URL Shortener
date: 2023-12-25 11:34:00
tags:
  - Go
  - Kubernetes
  - Microservices
---
!!! danger "In Development"
    URLify Hub is currently under active development and not yet available for public use. Stay tuned for updates!

The URL Shortener project employs a microservices architecture to efficiently manage and redirect URLs. It integrates URL processing, analytics, and database services, ensuring high scalability and performance for web applications.

## Microservices Architecture

```mermaid
graph LR
 
    A(Internet) -->|requests| B(Ingress)

    B -->|shorten URL| C(URL Shortening Service)
    B -->|redirect URL| D(URL Redirection Service)

    C -->|store/retrieve| E(Database)
    D -->|retrieve| E
    D -->|log access| F(URL Analytics Service)
    F -->|store analytics| H(Database)

    G(Scheduled Cleanup Service) -->|clean/maintain| E
```

---

## Architecture Overview

- **Internet**: Entry point for user requests.
- **Ingress**: Routes requests to either the URL Shortening Service or the URL Redirection Service.
- **URL Shortening Service**: Handles creation of shortened URLs.
- **URL Redirection Service**: Manages redirection to original URLs and logs access data.
- **Database for URL Service**: Stores data for shortened and original URLs.
- **URL Analytics Service**: Processes access logs from the URL Redirection Service.
- **Database for Analytics Service**: Stores analytical data processed by the URL Analytics Service.
- **Scheduled Cleanup Service**: Runs maintenance tasks on the URL service database.

---
