#!/bin/bash
terraform plan -var-file="config.tfvars"

terraform apply -auto-approve -var-file="config.tfvars"

