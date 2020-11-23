#!/bin/bash
SERVER_IP=$(python ./script/python/getServerIP.py)

echo "Ziping world from ${SERVER_IP}"
ssh -t -o "StrictHostKeyChecking no" "root@${SERVER_IP}" "cd ${BACKUP_NAME}; zip -q -r ../${BACKUP_NAME}.zip *; exit"
