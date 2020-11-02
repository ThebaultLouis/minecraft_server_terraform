#!/bin/bash
echo "Init credentials"
sh . ./script/credentials.sh
echo "Upload init backup server"
sh ./script/upload_init_world.sh
echo "Init project"
sh ./script/init.sh

#
sh ./install_from_backup.sh
