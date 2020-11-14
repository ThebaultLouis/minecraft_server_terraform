#!/bin/bash
SERVER_IP=$(python ./script/python/getServerIP.py)

echo "Unziping world from ${SERVER_IP}"
ssh -t -o "StrictHostKeyChecking no" "root@${SERVER_IP}" "unzip -q -d ${BACKUP_NAME} ${BACKUP_NAME}.zip; exit"