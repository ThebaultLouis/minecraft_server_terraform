#!/bin/bash
echo "Generate terraform config"
sh ./script/terraform/generate_terraform_config.sh

echo "Upload init backup server"
sh ./script/upload_init_world.sh

echo "Init project"
sh ./script/terraform/init.sh
