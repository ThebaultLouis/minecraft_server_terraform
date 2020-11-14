#!/bin/bash
SERVER_IP=$(python ./script/python/getServerIP.py)
echo "Downloading world from ${SERVER_IP}"

# Download
sftp "root@${SERVER_IP}" << EOF
get "${BACKUP_NAME}.zip" "worlds/${BACKUP_NAME}.zip"
bye