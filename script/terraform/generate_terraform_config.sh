#!/bin/bash
echo "pvt_key=\"~/.ssh/id_rsa\"" > config.tfvars
echo "do_token=\"$DO_PAT\"" >> config.tfvars
echo "BACKUP_NAME=\"$BACKUP_NAME\"" >> config.tfvars

