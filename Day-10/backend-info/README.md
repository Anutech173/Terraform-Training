# Terraform Backend – Technical Beginner Guide

## What is a Terraform Backend?

A **Terraform backend** is where Terraform **stores its state file** (`terraform.tfstate`) and manages operations like:
- Storing remote state
- Locking the state file during `plan` and `apply`
- Sharing state across teams

By default, Terraform uses the **local backend** (stores state on your machine). For real-world team and production usage, a **remote backend** like S3 + DynamoDB is preferred.

---

## Why Use a Remote Backend?

- Prevent multiple people from overwriting the state
- Store state securely in a remote location
- Enable collaboration with locking
- Make pipelines and automation stateless

---

## Common Backend Types

- `local` – default, stores state on disk
- `s3` – stores state in Amazon S3 (commonly used)
- `gcs` – Google Cloud Storage
- `azurerm` – Azure Blob Storage
- `remote` – Terraform Cloud or Enterprise

---

## Example: S3 Backend with DynamoDB Locking

### backend.tf

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
```

---

## How It Works

- The **S3 bucket** stores your `.tfstate` file
- The **DynamoDB table** locks the state file to prevent race conditions
- The `key` value defines the path to the state file inside the bucket


Use backends to manage infrastructure safely and collaboratively across environments and teams.
