# Security

## Security model

This repository is a public portfolio project. It is designed to demonstrate secure Infrastructure as Code practices without exposing cloud credentials or sensitive state.

### Controls currently implemented

- Terraform state files are excluded from source control
- Local `.tfvars` files are excluded, while example variable files remain available
- Private keys are excluded from source control
- Azure Managed Identity is used instead of embedding service-principal secrets
- Azure RBAC is scoped to the environment resource group
- Network security rules explicitly deny Internet-originated inbound traffic
- GitHub Actions has read-only repository contents permissions for the validation workflow
- CI validates Terraform without accessing a real Terraform backend

## Sensitive data

Never commit any of the following:

- Azure client secrets
- Access tokens
- Private keys
- Terraform state files
- Production `.tfvars` files containing sensitive values
- Cloud credentials or service-account files

Use environment variables, federated identity, managed identity, or an approved secret-management system for real deployments.

## Production considerations

A production implementation should additionally use:

- Remote encrypted Terraform state
- State access controls and locking/concurrency protection
- Federated GitHub-to-Azure authentication rather than long-lived CI secrets
- Policy-as-code
- IaC security scanning
- Azure Key Vault or an equivalent secret-management service
- Approval gates for production changes
- Centralized audit and diagnostic logging

These items are documented as future platform capabilities unless they are explicitly implemented in the repository.

## Reporting a vulnerability

Because this is a portfolio project, please do not publicly disclose credentials, tokens, private keys or other sensitive material in an issue.

If you identify a security problem in the repository, contact the author through the GitHub profile and provide enough information to reproduce the issue safely.

**Author:** Vasid Shaik  
**GitHub:** https://github.com/ShaikVasid
