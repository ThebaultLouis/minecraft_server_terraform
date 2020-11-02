# Launch server foreground
java -Xmx1024M -Xms1024M -jar server.jar nogui
# Launch server background
#nohup java -Xmx1024M -Xms1024M -jar server.jar nogui > log.log 2>&1 &