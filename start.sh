#!/bin/bash

cp /campfire/downloads/paper.jar /campfire/cozy/

cd cozy
if [ ! -e eula.txt ]
then
    java -jar paper.jar
    sed -i 's/false/true/g' eula.txt
    mkdir -p /campfire/cozy/plugins/WorldEdit
    mkdir -p /campfire/cozy/plugins/WorldGuard
fi

cp /campfire/downloads/worldedit.jar /campfire/cozy/plugins/worldedit.jar
cp /campfire/downloads/worldguard.jar /campfire/cozy/plugins/worldguard.jar

cp /campfire/configs/whitelist.json /campfire/cozy/whitelist.json
cp /campfire/configs/server.properties /campfire/cozy/server.properties
cp /campfire/configs/worldedit.yml /campfire/cozy/plugins/WorldEdit/config.yml
cp /campfire/configs/worldguard.yml /campfire/cozy/plugins/WorldGuard/config.yml

exec java -jar paper.jar nogui
