---
title: Restricting kernel module loading.
icon: material/newspaper-variant-outline
date: 2023-04-10 08:55:00
comments: true
categories:
- Kubernetes
- CKS
tags:
- CKS
- Kubernetes
---

### Introduction

In Linux systems, managing kernel modules is crucial for controlling hardware functionality and system behavior. This involves loading, listing, and blacklisting modules. This guide covers the basics of using `modprobe` to load modules, `lsmod` to list loaded modules, and configuring blacklists to prevent certain modules from loading.

---

### Commands and Configuration

#### 1. Loading a Module with `modprobe`

The `modprobe` command is used to load or remove modules from the Linux kernel.

  ```sh
  sudo modprobe pcspkr
  ```

  This command loads the `pcspkr` module, which controls the system speaker (often used for system beeps).

#### 2. Listing Loaded Modules with `lsmod`

The `lsmod` command displays the status of currently loaded modules in the Linux kernel.

  ```sh
  lsmod
  ```

  This command lists all the loaded kernel modules, providing information such as module size and usage count.

#### 3. Blacklisting Modules to Prevent Loading

Blacklisting is used to prevent certain kernel modules from being loaded automatically.

- **Blacklist Configuration Syntax**:

  ```sh
  blacklist <module_name>
  ```

  This syntax is used in configuration files to specify modules that should not be loaded.

#### 4. Blacklist Configuration File and Verifying with Reboot

To blacklist a module, you add its name to a configuration file in `/etc/modprobe.d/`.

- **Steps**:
  1. **Edit/Create Configuration File**:

     ```sh
     sudo nano /etc/modprobe.d/blacklist.conf
     ```

     Add the following line to the file:

     ```sh
     blacklist pcspkr
     ```

     This prevents the `pcspkr` module from being loaded.

  2. **Reboot**:

     ```sh
     sudo reboot
     ```

     Reboot the system to apply the changes.

  3. **Verify with `lsmod`**:
     After rebooting, check if the module is loaded:

     ```sh
     lsmod | grep pcspkr
     ```

     If the module is blacklisted correctly, it should not appear in the `lsmod` output.

By using these commands and configurations, you can effectively manage kernel modules, enhancing control over your system's hardware and functionality.
