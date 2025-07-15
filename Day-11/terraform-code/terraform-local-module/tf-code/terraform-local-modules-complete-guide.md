# 📘 Terraform Local Modules – Complete Guide

Terraform modules help you organize and reuse code efficiently. A **local module** is a folder containing Terraform configuration files (`.tf`) within your local file system. You can reference it using the `source` argument when writing your Terraform configurations.

---

##  What is a Local Module?

A **local module** is a custom-built set of Terraform resources stored in a folder **within your own system**. You use it to group and reuse infrastructure definitions.

###  Example Structure:
```
terraform-project/
├── main.tf
├── variables.tf
└── modules/
    └── my-vpc/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

###  Usage in Terraform:
```hcl
module "vpc" {
  source = "./modules/my-vpc"
  cidr   = "10.0.0.0/16"
}
```

---

##  When to Use Local Modules

Local modules are especially useful in the following scenarios:

### 1.  No Internet Access
If your Terraform environment (e.g., inside a secured VPC or air-gapped system) has no internet access to pull modules from Terraform Registry or GitHub.

### 2.  Need for Customization
When official Terraform modules don’t exactly fit your use case and you want full control to modify or extend functionality.

### 3.  Reusability Across Projects or Environments
Avoid duplicating code across `dev`, `qa`, `prod`—use local modules with environment-specific variables instead.

### 4.  Faster Prototyping
Test features quickly without publishing to remote repositories or dealing with versioning.

### 5.  Better Team Collaboration
Different teams (network, security, compute) can independently maintain their modules under the same repo.

---

##  Understanding `source` Paths for Local Modules

Terraform supports relative path references to locate your local modules.

### `./` – Current Directory
Points to a subfolder/module in the same directory as the `.tf` file.
```hcl
source = "./my-module"
```

### `../` – One Directory Up
Used when the module is in the parent directory.
```hcl
source = "../shared-vpc"
```

### `../../` – Two Levels Up
Use this when your module is stored further up the folder hierarchy.
```hcl
source = "../../modules/network"
```

---

##  Example Scenario:

 Directory Tree:
```
terraform/
├── main.tf
└── modules/
    └── ec2/
```

 Code:
```hcl
module "ec2" {
  source = "./modules/ec2"
}
```

---

##  Best Practices for Using Local Modules

-  Do **not** use `version =` with local paths (only for remote modules).
-  Keep modules **self-contained** and modular.
-  Use `variables.tf`, `outputs.tf`, and `README.md` inside each module.
-  Stick to shallow relative paths (avoid `../../../modules/...` if possible).
-  Keep module inputs (variables) and outputs clean and well-documented.

---
