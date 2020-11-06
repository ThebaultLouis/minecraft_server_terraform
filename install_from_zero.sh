#!/bin/bash
echo "Generate terraform config"
sh ./script/generate_terraform_config.sh

echo "Upload init backup server"
sh ./script/upload_init_world.sh

echo "Init project"
sh ./script/init.sh

#
sh ./install_from_backup.sh
