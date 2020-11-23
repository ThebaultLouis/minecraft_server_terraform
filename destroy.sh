#!/bin/bash

# Ziping the backup
sh ./script/zip/zip_world.sh

# # Downloading backup from server
sh ./script/sftp/download_world_from_server.sh

# echo "Deleting minecraft server"
sh ./script/terraform/destroy.sh