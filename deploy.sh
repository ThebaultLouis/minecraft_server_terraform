#!/bin/bash
echo "Generate terraform config"
sh ./script/terraform/generate_terraform_config.sh

echo "Starting project"
sh ./script/terraform/start.sh

echo "Minecraft server on :"
python ./script/python/getMinecraftServerIP.py

# Accept fingerprint
sh ./script/sftp/accept_fingerprint.sh
# Uploading backup to server
sh ./script/sftp/upload_world_to_server.sh
# Unziping the backup to server
sh ./script/zip/unzip_world.sh

echo "Connecting to shh"
sh ./script/connect_to_ssh.sh