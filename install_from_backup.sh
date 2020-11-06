#!/bin/bash
echo "Generate terraform config"
sh ./script/generate_terraform_config.sh

echo "Starting project"
sh ./script/start.sh

echo "Minecraft server on :"
python ./script/python/getMinecraftServerIP.py

echo "Connecting to shh"
sh ./script/connect_to_ssh.sh