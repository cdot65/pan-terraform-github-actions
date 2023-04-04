# PAN-OS provisioning with GitHub Actions

This repository contains a GitHub Action that can be used to provision PAN-OS devices with configuration files.

## Usage

The action can be used in a workflow file like this:

```yaml
name: Provision PAN-OS
```

```yaml
on: [push]
```

## Example workflow

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Provision PAN-OS
      uses: PaloAltoNetworks/panos-github-actions@master
      with:
        ip: ${{ secrets.PANOS_IP }}
        username: ${{ secrets.PANOS_USERNAME }}
        password: ${{ secrets.PANOS_PASSWORD }}
        config: config.xml
```

## Project Structure

The project is structured as follows:

```bash
project_root/
  ├── .github/
  │   └── workflows/
  │       └── terraform.yml
  ├── auth-files/
  │   ├── auth-dal-vfw-01.json
  │   ├── auth-hou-vfw-01.json
  │   └── auth-san-vfw-01.json
  ├── environments/
  │   ├── dal-vfw-01/
  │   │   ├── main.tf
  │   │   └── terraform.tfvars
  │   ├── hou-vfw-01/
  │   │   ├── main.tf
  │   │   └── terraform.tfvars
  │   └── san-vfw-01/
  │       ├── main.tf
  │       └── terraform.tfvars
  ├── modules/
  │   └── firewall/
  │       ├── main.tf
  │       ├── null_resource.tf
  │       ├── outputs.tf
  │       ├── panos_provider.tf
  │       └── variables.tf
  └── scripts/
      ├── firewall-commit.go
      └── go.mod
```