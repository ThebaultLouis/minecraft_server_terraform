#!/bin/bash
SERVER_IP=$(python ./script/python/getServerIP.py)
echo "Connecting to ${SERVER_IP}"
ssh -t -o "StrictHostKeyChecking no" root@${SERVER_IP} "cd ${BACKUP_NAME};exit"