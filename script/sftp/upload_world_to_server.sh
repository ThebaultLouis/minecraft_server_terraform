#!/bin/bash
SERVER_IP=$(python ./script/python/getServerIP.py)
echo "Uploading world to ${SERVER_IP}"
sftp "root@${SERVER_IP}" << EOF
put "worlds/${BACKUP_NAME}.zip" "${BACKUP_NAME}.zip"
bye