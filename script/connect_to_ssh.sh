#!/bin/bash
SERVER_IP=$(python ./script/python/getServerIP.py)
echo "Connecting to ${SERVER_IP}"
ssh -t -o "StrictHostKeyChecking no" root@${SERVER_IP} "cd ${AWS_S3_BACKUP_NAME};bash -l"