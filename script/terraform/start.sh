#!/bin/bash
terraform plan -var-file="config.tfvars" -out "terraform.tfplan"

terraform apply -auto-approve -var-file="config.tfvars"

