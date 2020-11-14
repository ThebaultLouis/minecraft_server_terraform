#!/bin/bash
terraform plan -destroy -var-file="config.tfvars" -out "terraform.tfplan"

terraform apply terraform.tfplan