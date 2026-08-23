# Architecture Notes

## Scope

This project models a small AWS landing-zone style foundation using Terraform modules and environment composition.

## Network design

Each environment creates a dedicated VPC with:

- Two public subnets across availability zones
- Two private subnets across availability zones
- Internet Gateway
- Public route table
- DNS support and hostnames enabled

Private subnets are intentionally not given a default route to the Internet in this portfolio baseline. Production workloads requiring outbound access should use a controlled NAT design.

## Module boundaries

- `networking`: VPC, subnets, Internet Gateway, routing
- `security`: application security group
- `iam`: EC2 trust role and instance profile
- `compute`: reusable EC2 resource module for workloads that require it

## Environment strategy

`dev` and `prod` consume the same modules with separate CIDR ranges and tags. This keeps infrastructure logic reusable while allowing environment-specific composition.

## Security considerations

- Credentials are supplied through the AWS credential chain, never Terraform source code.
- State files are excluded from Git.
- IAM is separated into a dedicated module.
- Security-group ingress is restricted to the VPC CIDR in the example.
- Production deployments should use remote encrypted state with locking and controlled CI credentials.

## Operational model

The repository validates Terraform with GitHub Actions. A future production pipeline can add policy-as-code, security scanning, plan artifacts, approval gates, and controlled apply jobs without changing the module interfaces.
