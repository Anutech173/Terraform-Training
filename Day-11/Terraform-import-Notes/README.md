
# Terraform Import – EC2 Instance (Beginner Guide)

This guide walks you through importing an **existing EC2 instance** into Terraform without recreating the resource.

---

##  What is `terraform import`?

`terraform import` is a Terraform CLI command that allows you to bring **existing infrastructure** under Terraform management. It maps a manually created or pre-existing cloud resource to a resource block defined in your Terraform code.

---

## When to use `terraform import`?

Use `terraform import` when:

- You created resources manually via AWS Console or CLI but want to manage them using Terraform going forward.
- You are migrating existing infrastructure into Infrastructure as Code (IaC).
- You want to **standardize** infrastructure management across teams using Terraform.

---

## Why use `terraform import`?

- To avoid **recreating resources** that already exist.
- To establish **Terraform state** for existing resources.
- To begin using **version-controlled code** for resources that were initially created manually or by other tools.

---

##  Goal

You already have an EC2 instance **manually created** in AWS, and now you want to **bring it under Terraform management** without destroying and recreating it.

---

##  Resource Definition (Terraform Code)

Here’s the Terraform code for an EC2 instance:

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0fd26c36a83ae0088"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
```

And variables:

```hcl
variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "imported-ec2"
}
```

---

##  Step-by-Step: How to Import an Existing EC2 Instance

###  1. Note the EC2 instance ID from AWS Console

Suppose it is:

```
i-0f123456789abcdef
```

---

###  2. Create the Terraform resource block (as shown above)

Save it in `main.tf`, with `instance_type` and `instance_name` matching what already exists.

---

###  3. Initialize Terraform

```bash
terraform init
```

---

###  4. Import the EC2 instance

```bash
terraform import aws_instance.web i-0f123456789abcdef
```

* `aws_instance.web` → matches the resource name in your `.tf` file  
* `i-0f123456789abcdef` → is the **actual EC2 instance ID**

---

###  5. Run a `terraform plan` to inspect changes

```bash
terraform plan
```

 You might see **some differences** if:

* Tags are missing or extra  
* AMI ID is different from what’s in Terraform  

You can choose to either:

* Update Terraform code to match real EC2 state  
* Or let Terraform update the EC2 to match code on the next `apply`

---

##  Important Notes

- Terraform **does not auto-generate the resource block** — you must define it manually.
- After import, **review and reconcile** differences using `plan`.
- You can import any resource Terraform supports (not just EC2).

---


