# Terraform Workspaces – Technical Beginner Guide

## What is a Terraform Workspace?

A **Terraform Workspace** is an isolated instance of your Terraform state.

Each workspace:
- Uses the **same Terraform configuration/code**
- Maintains a **separate state file**
- Allows deploying the same infrastructure to **different environments** like `dev`, `qa`, or `prod` without modifying code

## Why Use Workspaces?

Terraform by default uses a workspace named `default`. If you want to manage multiple environments using the same code:
- Without duplicating code
- And without overwriting each other’s state

You use **workspaces** to maintain separate **state files** per environment.

## How Terraform Workspaces Work

- Each workspace stores its **own Terraform state file**
- You **select** a workspace before running `plan` or `apply`
- The state file is saved under `.terraform/terraform.tfstate.d/<workspace>/terraform.tfstate`

## Example Use Case

Let's say you have a Terraform configuration to create an S3 bucket.

```hcl
resource "aws_s3_bucket" "example" {
  bucket = "my-company-${terraform.workspace}"
  acl    = "private"
}
```

If you deploy this in:
- `dev` workspace → bucket will be `my-company-dev`
- `prod` workspace → bucket will be `my-company-prod`

## Terraform Workspace Commands

### Create a new workspace
```bash
terraform workspace new dev
```

### List all workspaces
```bash
terraform workspace list
```

### Switch to a workspace
```bash
terraform workspace select dev
```

### Show the current workspace
```bash
terraform workspace show
```

## Workspace State Storage (Local Backend)

When using local backend, state files are stored like this:

```
.terraform/
  terraform.tfstate.d/
    dev/
      terraform.tfstate
    prod/
      terraform.tfstate
```

## Best Practice with Workspaces

- Use `terraform.workspace` in your resource naming to avoid conflicts.
- Keep backend configuration consistent.
- Don’t use workspaces for managing multiple projects — only for **environments of the same project**.
- For large-scale infra with separate pipelines or teams, prefer **separate Terraform directories or modules** with **individual backends**.

## Deployment Flow using Workspaces

```bash
# Step 1: Init
terraform init

# Step 2: Create/select the workspace
terraform workspace new dev
terraform workspace select dev

# Step 3: Plan and Apply
terraform plan
terraform apply
```
