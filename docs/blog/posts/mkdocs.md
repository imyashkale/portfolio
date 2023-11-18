---
title: MkDocs Site Setup Guide
icon: material/newspaper-variant-outline
date: 2023-11-18 13:34:01
categories:
  - Github Actions
---

This guide provides a step-by-step approach to setting up an MkDocs site, specifically for the "Imyashkale" project. It includes system requirements, installation steps, and a detailed explanation of the `mkdocs.yml` configuration file.

## Resources

- [Official Docs](https://squidfunk.github.io/mkdocs-material/setup/)
- [How To Create STUNNING Code Documentation With MkDocs Material Theme - Youtube](https://youtu.be/Q-YA_dA8C20?si=ykJKZsdocX3K6Ndr)

## System Requirements

To set up an MkDocs site, ensure your system meets the following requirements:

- **Python**: Version 3.5 or higher.
- **pip**: Python's package installer.

## Installation

1. **Install MkDocs**:

   ```bash
   pip install mkdocs
   ```
2. **Install Material Theme**:

   ```bash
   pip install mkdocs-material
   ```
3. **Clone Your Repository** (if applicable):

   ```bash
   git clone https://github.com/imyashkale/portfolio.git
   ```
4. **Navigate to Your Project Directory**:

   ```bash
   cd imyashkale
   ```
5. **Start MkDocs Server**:

   ```bash
   mkdocs serve
   ```

## Basic Configuration

### `site_name`

- **Description**: The name of the site.
- **Value**: `Imyashkale`

### `repo_url`

- **Description**: The URL of the site's associated Git repository.
- **Value**: `https://github.com/imyashkale/portfolio.git`

### `site_url`

- **Description**: The URL where the site is hosted.
- **Value**: `https://imyashkale.com`

## Navigation Structure

### `nav`

- **Description**: Defines the structure of the site navigation.
- **Structure**:
  - Home page linked to `index.md`.
  - Kubernetes section with a subpage.
  - Others section with links to MKDocs and AcloudGuru pages.

## Theme Configuration

### `theme`

- **Description**: Specifies the theme settings.
- **Details**:
  - **Name**: `material` - Uses the Material theme.
  - **Palette**:
    - Light mode with deep purple primary color.
    - Dark mode slate scheme with deep purple primary color.
  - **Features**:
    - Various navigation features like tabs, instant loading, tracking, etc.
    - Table of contents integration.
    - Search enhancements.
    - Code-related features like annotation and copy.

## Markdown Extensions

### `markdown_extensions`

- **Description**: Extensions to enhance Markdown functionality.
- **Included Extensions**:
  - `def_list`: For definition lists.
  - `pymdownx.tasklist`: Custom checkboxes in task lists.
  - `pymdownx.highlight`: Syntax highlighting with line numbers.
  - `pymdownx.inlinehilite`: Inline syntax highlighting.
  - `pymdownx.snippets`: Reusable content snippets.
  - `admonition`: For creating admonitions.
  - `pymdownx.arithmatex`: For mathematical content.
  - `footnotes`: To add footnotes.
  - `pymdownx.details`: For collapsible content blocks.
  - `pymdownx.superfences`: Enhanced code blocks.
  - `pymdownx.mark`: For marking text.
  - `attr_list`: Attribute lists for more control over Markdown elements.

## Copyright Notice

### `copyright`

- **Description**: A copyright notice for the site.
- **Value**: `Copyright &copy; Yash Kale`

## Extra Configuration

### `extra`

- **Description**: Additional site configurations.
- **Details**:
  - Social links to GitHub and LinkedIn with respective icons.

## Configuration File

```yaml
site_name: Imyashkale
repo_url: https://github.com/imyashkale/imyashkale
site_url: https://imyashkale.com
nav:
  - Home: index.md
  - Kubernetes:
    - Overview: kubernetes/index.md
  - Others:
    - MKDocs: others/mkdocs.md
    - AcloudGuru: others/acloudguru.md
    
theme:
  name: material
  palette: 
    # Palette toggle for light mode
    - scheme: default
      primary: deep purple
      toggle:
        icon: material/lightbulb
        name: Switch to dark mode

    # Palette toggle for dark mode
    - scheme: slate
      primary: deep purple
      toggle:
        icon: material/lightbulb-outline
        name: Switch to light mode
  
  features:
    - navigation.tabs
    - navigation.path
    - navigation.instant
    - navigation.instant.progress
    - navigation.tracking
    - navigation.top
    - toc.integrate
    - search.suggest
    - search.highlight
    - content.code.annotate
    - content.code.copy
    - content.tabs.link


markdown_extensions:
  - def_list
  - pymdownx.tasklist:
      custom_checkbox: true
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - admonition
  - pymdownx.arithmatex:
      generic: true
  - footnotes
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.mark
  - attr_list

copyright: Copyright &copy; Yash Kale

extra:
  social:
    - icon: fontawesome/brands/github-alt
      link: https://github.com/imyashkale
    - icon: fontawesome/brands/linkedin
      link: https://www.linkedin.com/in/imyashkale/
```

---

This configuration establishes a robust and feature-rich documentation site, leveraging the Material theme and various Markdown extensions for enhanced content presentation. The site structure, theme, and extensions can be modified as per future requirements.
