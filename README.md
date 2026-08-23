# Terraform Azure Cloud Infrastructure

This is a Terraform project I use to demonstrate how I approach Azure infrastructure when I want the code to be reusable instead of having everything in one environment file.

The main focus is the Azure side: networking, security, identity, environment separation, and the Terraform workflow around those pieces.

## What is in here

- Azure Resource Groups and Virtual Networks
- Separate public and private subnets
- Network Security Groups
- Managed Identity and Azure RBAC
- Reusable Terraform modules
- Dev and prod environment structure
- Terraform validation through GitHub Actions
- Basic naming and tagging conventions

This is a portfolio project, not a copy of an employer environment. The point is to show how I would structure the infrastructure and the decisions I would make around it.

## Layout

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
├── .gitignore
├── Makefile
└── README.md
```

## How I normally work with it

I keep the environment-specific values in `environments/` and the reusable building blocks in `modules/`. That makes it easier to change a network or identity component without duplicating the same Terraform across environments.

For a local run:

```bash
az login
az account set --subscription "<subscription-id>"

cd environments/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

I deliberately keep `terraform apply` out of the CI validation workflow. A plan should be reviewed before anything changes in a shared environment.

## A few design choices

### Networking

The networking module creates the resource group, VNet, and public/private subnets. The intent is to keep application workloads in the private side and expose only the components that actually need public access.

### Security

NSGs are defined separately so the network rules are easy to review. I avoid opening broad inbound access just to make an example work.

### Identity

The identity module uses a managed identity and Azure RBAC rather than putting service-principal credentials into Terraform or application configuration.

### Scope

RBAC should be assigned at the smallest useful scope. If a workload only needs access to one resource group, there is usually no reason to grant the same permission at subscription scope.

## CI

GitHub Actions checks formatting and runs `terraform validate`. It does not deploy Azure resources automatically.

## Technologies

**Terraform · Microsoft Azure · Azure VNet · Azure NSG · Azure RBAC · Managed Identity · GitHub Actions · Infrastructure as Code**

## Notes

I am continuing to expand this repository with more Azure services and a proper remote-state setup. The current version is intentionally small enough to read through without needing to understand a large platform first.
