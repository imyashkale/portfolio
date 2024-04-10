---
title: Securing Kubernetes with Falco
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

<!-- markdownlint-disable MD033 -->
<figure markdown="span">
  ![CKA](../../../assets/img/falco.png){ width="300" }
</figure>

---

Falco is an open-source runtime security tool that can help Certified Kubernetes Security Specialists (CKS) enhance the security posture of their Kubernetes clusters. Developed by Sysdig, Falco is designed to monitor, detect, and alert on abnormal behavior in your Kubernetes environment.

!!! info "Documentation"
    [Falco Official Documentation](https://falco.org/docs){:target="_blank"}.

---

## How Falco Works

Falco leverages the Linux kernel's extended Berkeley Packet Filter (eBPF) capabilities to intercept system calls and analyze system activity in real-time. It uses a set of rules written in a custom language to define what is considered normal and abnormal behavior. When Falco detects a rule match, it generates an alert that can be used to trigger automated responses or manual investigation.

---

## Key Features of Falco

1. **Container Visibility**: Falco provides deep visibility into container activity, including file and network activity, process execution, and more.

2. **Rule-Based Detection**: Falco's rule-based detection allows you to define custom rules to detect specific security events or violations.

3. **Real-Time Alerts**: Falco can generate real-time alerts based on rule matches, allowing you to respond quickly to potential security incidents.

---

## Falco Rule

Explanation of the rule components:

```yaml
- rule: Shell Spawned in Container
  desc: Detects when a shell is spawned in a container
  condition: shell_spawned
  output: "Shell spawned in container (user=%user.name command=%proc.cmdline)"
  priority: WARNING
  tags: [container, shell]
```

- **rule**: The name of the rule, which is "Shell Spawned in Container" in this case.
- **desc**: A description of what the rule is designed to detect, which is when a shell is spawned in a container.
- **condition**: The condition that must be met for the rule to trigger. In this case, `shell_spawned` is a predefined condition in Falco that detects when a shell is spawned.
- **output**: The output message that will be generated when the rule triggers. It includes information about the user and the command that spawned the shell.
- **priority**: The priority level of the rule, which is set to WARNING in this case.
- **tags**: Tags used to categorize the rule, such as "container" and "shell".

---

## Falco Configuration Files

- The rules file in Falco
typically located at `/etc/falco/falco_rules.yaml` or `/etc/falco/falco_rules.local.yaml`, contains the rules used to detect security events and trigger alerts.

- The `falco_rules.yaml` file includes default rules provided by Falco, while the `falco_rules.local.yaml` file allows for the addition of custom rules or the override of existing ones.

- These rules are written in YAML format and define conditions, outputs, priorities, and tags for each rule to specify the behavior when certain events are detected. Customizing the rules file allows users to tailor Falco's behavior to their specific security requirements.

---

## Analyzing Falco Logs

Falco, a powerful runtime security tool for Kubernetes, generates logs that can be instrumental in detecting and responding to security incidents. One common use case is monitoring for shell-related events, which can indicate unauthorized access or malicious activity.

---

### Viewing Falco Logs

To view Falco logs related to shell events, you can use the following command:

```sh
cat /var/log/syslog | grep falco | grep shell
```

This command filters the syslog for entries containing both "falco" and "shell", showing relevant logs.

---

### Using journalctl for Falco Logs

Another way to view Falco logs is using `journalctl`, which provides access to the systemd journal where Falco logs are stored:

```sh
sudo journalctl -u falco | grep shell
```

This command retrieves logs related to Falco (`-u falco`) and filters them for shell events.

---

### Restarting Falco Service

To restart the Falco service, use the following command:

```sh
sudo systemctl restart falco
```

This command stops and then starts the Falco service, applying any configuration changes or updates.

### Starting Falco Service

To start the Falco service if it's not running, use the following command:

```sh
sudo systemctl start falco
```

This command starts the Falco service, which begins monitoring your system for security events.

### Stopping Falco Service

To stop the Falco service, use the following command:

```sh
sudo systemctl stop falco
```

This command stops the Falco service, temporarily halting monitoring until the service is started again.

---

### Interpreting Falco Logs

Each log entry typically includes details such as the time of the event, the rule that triggered the event, and additional context like the process name or user involved. For example, a log entry might indicate that a shell was spawned in a container and provide information about the user and the command used to spawn the shell.

---

### Responding to Falco Alerts

When Falco detects a shell-related event, it generates an alert, which can be used to trigger automated responses or manual investigation. By monitoring Falco logs regularly, administrators can quickly identify and respond to security threats, helping to ensure the security of their Kubernetes environment.

---
