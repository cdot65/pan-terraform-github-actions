# Firewall Configuration Automation 🛡️🔧

This project automates the deployment and configuration of firewalls using Terraform and a custom Go binary, `firewall-commit`.

## Table of Contents

- [Firewall Configuration Automation 🛡️🔧](#firewall-configuration-automation-️)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Configuration](#configuration)
    - [Usage](#usage)
  - [Terraform Configuration Files](#terraform-configuration-files)

## Overview

This project is designed to automate the deployment and configuration of firewalls. It uses Terraform to configure the firewalls and a custom Go binary, `firewall-commit`, to commit the changes. The project is integrated with GitHub Actions for seamless deployment, using self-hosted runners and GitHub repository Secrets to manage sensitive data.

## Getting Started

### Prerequisites

Before you get started, ensure you have the following installed on your system:

- [Go](https://golang.org/dl/) (1.17 or later)
- [Terraform](https://www.terraform.io/downloads.html) (1.1.0 or later)
- Git

### Configuration

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/firewall-config-automation.git
    cd firewall-config-automation
    ```

2. Set up your firewall credentials as GitHub Secrets in your repository:

- Go to your repository's "Settings" tab.
- Click on "Secrets" in the left sidebar.
- Click on the "New repository secret" button.
- Add two secrets: `PANOS_USERNAME` and `PANOS_PASSWORD`, with the appropriate values.

### Usage

1. Update the Terraform configuration files in the `san-vfw-01` directory as needed. See [Terraform Configuration Files](#terraform-configuration-files) for details.

2. Push changes to the `main` branch:

    ```bash
    git add .
    git commit -m "Update firewall configurations"
    git push
    ```

3. The GitHub Actions workflow will automatically deploy the changes, commit the configurations, and destroy the resources.

## Terraform Configuration Files

This project uses the following Terraform configuration files:

- `main.tf`: The main configuration file that contains the provider configuration and resources to deploy.
- `variables.tf`: Contains input variable definitions used in the project.
- `outputs.tf`: Contains output variable definitions to display useful information after Terraform runs.

Update these files as needed to configure your firewall deployment.

---
