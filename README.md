# Terraform Cloud Infrastructure

Production-style Infrastructure as Code portfolio project demonstrating reusable Terraform patterns for AWS cloud infrastructure.

## What this project demonstrates

- Reusable Terraform modules
- Environment separation for dev and prod
- VPC networking with public and private subnets
- IAM least-privilege patterns
- EC2-based compute
- Remote-state-ready project structure
- Terraform formatting and validation in GitHub Actions
- Safe variable handling through `.tfvars.example`
- Infrastructure design, security, and operational documentation

> This repository is a portfolio implementation designed to demonstrate engineering practices. It does not represent a production environment or claim ownership of infrastructure operated for an employer.

## Architecture

```text
                         AWS
                          |
                    +-----+-----+
                    |    VPC    |
                    +-----+-----+
                          |
             +------------+------------+
             |                         |
       Public Subnets             Private Subnets
             |                         |
      +------+-------+          +------+-------+
      | Load Balancer|          | Application  |
      | / Bastion    |          | Workloads    |
      +------+-------+          +------+-------+
             |                         |
             +------------+------------+
                          |
                    IAM / Security
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
- AWS CLI configured with appropriate credentials
- An AWS account for deployment

Example:

```bash
cd environments/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

Never commit real credentials, state files, private keys, or environment-specific secrets.

## CI/CD

GitHub Actions runs Terraform formatting and validation checks on pull requests and pushes affecting Terraform code.

The workflow intentionally does **not** automatically apply infrastructure. Production changes should go through review and an explicit deployment process.

## Design principles

### Reusability

Networking, compute, security, and IAM are separated into modules so environments can compose the same building blocks with different configuration.

### Security

The design follows least privilege, avoids hard-coded credentials, separates public and private network resources, and keeps secrets out of source control.

### Reliability

Infrastructure changes are validated before deployment, environments are separated, and operational actions are documented.

### Maintainability

Resources use consistent naming and tagging conventions. Variables and outputs provide clear module interfaces.

## Skills demonstrated

**Terraform · AWS · Infrastructure as Code · GitHub Actions · IAM · VPC · EC2 · Linux · Cloud Security · CI/CD · DevOps · SRE**

## Author

Vasid Shaik  
Cloud / DevOps / SRE Engineer
