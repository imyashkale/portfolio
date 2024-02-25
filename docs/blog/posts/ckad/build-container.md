---
title: Building and Modifying Container Images Using Docker Commands
date: 2023-12-12 12:00:01
comments: true
categories:
- Kubernetes
- CKAD
tags:
- Kubernetes
- CKAD
---

<!-- markdownlint-disable MD033 -->
<figure markdown="span">
  ![CKAD](../../../assets/img/ckad.png){ width="300" }
</figure>

---

#### Overview

Building and modifying container images are crucial skills for developers working with Docker and Kubernetes. This guide covers the essential Docker commands for creating and updating container images, especially for Go applications.

!!! tip "Documentation"
    [Docker CLI documentation](https://docs.docker.com/engine/reference/commandline/cli/){:target="_blank"}.

---

#### Building a Container Image

!!! Warning
    Ensure this Dockerfile is placed in the root of your Go project directory.

1. **Create a Dockerfile**:

      Start by writing a Dockerfile for your Go application. This file contains instructions to build the image.

      Example Dockerfile for Go:

      ```Dockerfile title="Dockerfile"
      FROM golang:1.16-buster
      WORKDIR /app
      COPY go.mod go.sum ./
      RUN go mod download
      COPY *.go ./
      RUN go build -o /myapp
      CMD ["/myapp"]
      ```

2. **Build the Image**:

      Use the `docker build` command.

      ```bash
      docker build -t my-go-app .
      ```

3. **Verify the Image**:

      Check the newly created image using `docker images`.

---

#### Modifying an Existing Container Image

1. **Update the Dockerfile**:

      Make necessary changes to the Dockerfile, such as updating base images or changing build instructions.

2. **Rebuild the Image**:

      Use the `docker build` command with a new tag or version.

      ```bash
      docker build -t my-go-app:v2 .
      ```

3. **Clean Up Old Images**:

      Remove unused or old images to free up space.

      ```bash
      docker image prune
      ```

---

#### Advanced Docker Commands

1. **Tagging Images**:

      Use `docker tag` to assign new tags to existing images for better version control.
  
      ```bash
      docker tag my-go-app my-go-app:v1
      ```

2. **Inspecting Images**:

      `docker inspect` provides detailed information about an image's configuration and layers.
  
      ```bash
      docker inspect my-go-app
      ```

3. **Pushing to Docker Hub**:

      Push your image to a registry like Docker Hub using `docker push`
  
      ```bash
      docker push myusername/my-go-app:v1
      ```

---

#### Integration with Kubernetes

- Once the Docker image is ready, it can be deployed in a Kubernetes cluster using deployment manifests.

---

#### Conclusion

!!! note "Further Resources"
    [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/){:target="_blank"}.

Understanding Docker commands for building and modifying container images is vital for Go developers and for CKAD prepration in a Kubernetes environment. This knowledge enables efficient development, testing, and deployment of containerized applications.

---
