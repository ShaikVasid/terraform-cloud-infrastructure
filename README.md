# Terraform Azure Cloud Infrastructure

Production-style Infrastructure as Code portfolio project demonstrating reusable Terraform patterns for **Microsoft Azure** cloud infrastructure.

## What this project demonstrates

- Reusable Terraform modules
- Dev/prod environment separation
- Azure Resource Groups and VNets
- Public/private subnet architecture
- Network Security Groups
- Azure managed identities
- Azure RBAC with least-privilege access
- Terraform formatting and validation in GitHub Actions
- Secure variable handling
- Infrastructure design, security, and operational documentation

> This repository is a portfolio implementation designed to demonstrate engineering practices. It does not represent a production environment or claim ownership of infrastructure operated for an employer.

## Architecture

```text
                         Microsoft Azure
                                |
                       +--------+--------+
                       |  Resource Group |
                       +--------+--------+
                                |
                         +------+------+
                         |     VNet    |
                         +------+------+
                                |
                 +--------------+--------------+
                 |                             |
          Public Subnet                  Private Subnet
                 |                             |
          +------+-------+              +------+-------+
          | NSG / Ingress|              | Application  |
          | Controls     |              | Workloads    |
          +--------------+              +------+-------+
                                                |
                                         Managed Identity
                                                |
                                           Azure RBAC
```

## Repository structure

```text
.
├── .github/workflows/terraform.yml
├── architecture/architecture.md
├── environments/
│   ├── dev/
│   └── prod/
├── modules/
│   ├── networking/
│   ├── compute/
│   ├── security/
│   └── iam/
├── scripts/
│   ├── validate.sh
│   └── destroy.sh
├── .gitignore
├── Makefile
└── README.md
```

## Terraform workflow

```text
Code change
    ↓
terraform fmt
    ↓
terraform init
    ↓
terraform validate
    ↓
terraform plan
    ↓
Code review
    ↓
terraform apply
```

## Getting started

Requirements:

- Terraform >= 1.6
- Azure CLI
- An Azure subscription
- Appropriate Azure permissions to create the resources

Authenticate locally:

```bash
az login
az account set --subscription "<subscription-id>"
```

Then:

```bash
cd environments/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

Never commit credentials, service-principal secrets, state files, private keys, or environment-specific secrets.

## Azure design

### Networking

The networking module creates an Azure Resource Group, Virtual Network, and separate public/private subnets. The structure is designed to provide a reusable foundation for application workloads.

### Security

The security module uses an Azure Network Security Group with explicit inbound rules. The default design avoids exposing application workloads directly to the public internet.

### Identity

The identity module creates a user-assigned managed identity and grants it the **Reader** role at resource-group scope. This demonstrates workload identity without embedding long-lived credentials in infrastructure or application code.

### Least privilege

Azure RBAC assignments should use the narrowest practical built-in role and scope. Broad subscription-level permissions should be avoided unless there is a documented requirement.

## CI/CD

GitHub Actions runs Terraform formatting and validation checks on pull requests and pushes affecting Terraform code.

The workflow intentionally does **not** automatically apply infrastructure. Production changes should go through review and an explicit deployment process.

## Design principles

### Reusability

Networking, compute, security, and identity are separated into modules so environments can compose the same building blocks with different configuration.

### Security

The design follows least privilege, uses managed identity rather than long-lived credentials, and keeps secrets out of source control.

### Reliability

Infrastructure changes are validated before deployment, environments are separated, and operational actions are documented.

### Maintainability

Resources use consistent naming and tagging conventions. Variables and outputs provide clear module interfaces.

## Skills demonstrated

**Terraform · Microsoft Azure · Azure VNet · Azure NSG · Azure RBAC · Managed Identity · Infrastructure as Code · GitHub Actions · Cloud Security · CI/CD · DevOps · SRE**

## Author

Vasid Shaik  
Cloud / DevOps / SRE Engineer
