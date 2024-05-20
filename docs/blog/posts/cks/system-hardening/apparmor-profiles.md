---
title: Restricting linux capabilities with AppArmor
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

AppArmor (Application Armor) is a Linux kernel security module that provides mandatory access control (MAC) to restrict the capabilities of programs. It enforces security policies, known as profiles, that define the file system and network resources a program can access. By confining applications, AppArmor reduces the potential impact of security breaches, limiting the damage a compromised application can cause. It is known for its ease of use and integration with various Linux distributions, providing a robust layer of defense to enhance system security.

---

## Key Concepts

- **Profiles**: AppArmor profiles define the permitted and denied actions for an application, enhancing security by restricting programs to a limited set of resources.
- **Modes**: AppArmor operates in two modes:
  - **Enforcement**: Enforces the rules defined in the profile, blocking any unauthorized actions.
  - **Complain**: Logs unauthorized actions but does not block them, useful for developing and testing profiles.

---

## Profile Types

- **Default Profiles**: Provided by the operating system or application vendor, covering common services and applications.
- **Custom Profiles**: Created or modified by administrators to suit specific security needs.

---

## Profile Components

- **Path Entries**: Specify file and directory access permissions.
- **Capability Entries**: Define allowed capabilities (e.g., network access, raw socket usage).
- **Network Rules**: Control access to network resources.

---

## Common Commands

- **Check Profile Status**:

  ```sh
  aa-status
  ```

  Displays the current status of AppArmor profiles, showing which profiles are loaded and their modes.

- **Load/Unload Profiles**:

  ```sh
  sudo apparmor_parser -r <profile_file>
  ```

  Loads or reloads a profile.

  ```sh
  sudo aa-disable <profile_name>
  ```

  Disables a profile.

- **Switch Profile Mode**:

  ```sh
  sudo aa-complain <profile_name>
  ```

  Switches a profile to complain mode.

  ```sh
  sudo aa-enforce <profile_name>
  ```

  Switches a profile to enforce mode.

---

## Best Practices

- **Least Privilege**: Ensure profiles grant the minimum necessary permissions to applications.
- **Regular Updates**: Keep profiles up to date with application changes and security patches.
- **Testing**: Use complain mode to test new or modified profiles before enforcing them.
- **Monitoring**: Regularly check logs for denied actions to identify potential issues or required profile adjustments.

---

## Kubernetes Integration

- **Pod Security**: AppArmor can be used to enhance pod security in Kubernetes by defining and enforcing AppArmor profiles for containers.
- **Annotations**: Apply AppArmor profiles to Kubernetes pods using annotations in the pod specification:

  ```yml
  metadata:
    annotations:
      container.apparmor.security.beta.kubernetes.io/<container_name>: <profile_name>
  ```

- **Default Profiles**: Utilize built-in AppArmor profiles for common applications within Kubernetes environments.

Understanding these aspects of AppArmor profiles will help you effectively manage and secure applications, particularly in containerized environments.
