#!/bin/bash
terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa" -var "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -var "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -var "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -var "AWS_S3_BUCKET_NAME=${AWS_S3_BUCKET_NAME}" -var "AWS_S3_BACKUP_NAME=${AWS_S3_BACKUP_NAME}"

terraform apply -auto-approve -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa" -var "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -var "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -var "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -var "AWS_S3_BUCKET_NAME=${AWS_S3_BUCKET_NAME}" -var "AWS_S3_BACKUP_NAME=${AWS_S3_BACKUP_NAME}"

