# Terraform Azure Cloud Infrastructure

A production-style Terraform project demonstrating how I structure reusable **Azure infrastructure** across environments.

The focus is on networking, security, identity, environment separation, and a clean Infrastructure as Code workflow.

## What is in here

- Azure Resource Groups and Virtual Networks
- Separate public and private subnets
- Network Security Groups
- User-assigned Managed Identity and Azure RBAC
- Reusable Terraform modules
- Separate dev and prod environments
- Terraform validation through GitHub Actions
- Consistent naming and tagging conventions
- Azure-focused design with no cloud-specific credentials committed to Git

## Repository layout

```text
.
├── .github/
│   └── workflows/
│       └── terraform.yml
├── architecture/
│   └── architecture.md
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   └── variables.tf
│   └── prod/
│       ├── main.tf
│       └── variables.tf
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── iam/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── scripts/
├── .gitignore
├── Makefile
└── README.md
```

## Architecture

```text
                     Azure
                       |
              +--------+--------+
              |  Resource Group  |
              +--------+--------+
                       |
                 Azure VNet
                       |
          +------------+------------+
          |                         |
     Public Subnet            Private Subnet
          |                         |
          +------------+------------+
                       |
              Security / Identity
                       |
                  Azure RBAC
```

## Environment model

Each environment owns its configuration while reusable infrastructure stays under `modules/`.

```text
                    modules/
                       |
          +------------+------------+
          |                         |
       environments/dev      environments/prod
          |                         |
      Azure Dev                 Azure Prod
```

This keeps environment-specific values out of reusable modules and avoids duplicating infrastructure implementation.

## How I work with it

Authenticate with Azure CLI:

```bash
az login
az account set --subscription "<subscription-id>"
```

Validate the development environment:

```bash
cd environments/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

For production:

```bash
cd environments/prod
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

I deliberately keep `terraform apply` out of the CI validation workflow. A plan should be reviewed before changes are applied to a shared environment.

## Module design

### Networking

Creates the Azure VNet and separate public/private subnets. The module receives its environment-specific configuration through variables and exposes resource IDs through outputs.

### Security

Defines an Azure Network Security Group separately from networking so security rules can be reviewed independently.

### Identity

Creates a user-assigned managed identity and assigns the Reader role at the resource-group scope. The design avoids storing service-principal secrets in Terraform configuration.

## CI

GitHub Actions performs Terraform formatting, initialization, and validation. It does not automatically deploy infrastructure.

## Security principles

- Managed identities instead of long-lived credentials
- Azure RBAC with scoped permissions
- Public and private network boundaries
- No secrets committed to source control
- Environment-specific configuration separated from reusable modules
- Infrastructure changes reviewed through Terraform plan

## Technologies

**Terraform · Microsoft Azure · Azure VNet · Azure NSG · Azure RBAC · Managed Identity · GitHub Actions · Infrastructure as Code**

## Portfolio connection

This repository represents the **Infrastructure as Code layer** of my Cloud / DevOps portfolio:

```text
Terraform Azure Infrastructure
             ↓
       Azure AKS Platform
             ↓
        GitOps / Argo CD
             ↓
      SRE / Observability
```

## Author

**Vasid Shaik**  
Cloud / DevOps / SRE Engineer
