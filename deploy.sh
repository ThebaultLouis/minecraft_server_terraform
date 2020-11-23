#!/bin/bash
echo "Generate terraform config"
sh ./script/terraform/generate_terraform_config.sh

echo "Starting project"
sh ./script/terraform/start.sh

echo "Minecraft server on :"
python ./script/python/getMinecraftServerIP.py

echo "Sending minecraft server IP to discord channel"
python3 ./script/python/sendMinecraftServerIPToUser.py

# Accept fingerprint
sh ./script/sftp/accept_fingerprint.sh
# Uploading backup to server
sh ./script/sftp/upload_world_to_server.sh
# Unziping the backup to server
sh ./script/zip/unzip_world.sh

echo "Connecting to shh"
sh ./script/start_server.sh