FROM openjdk:17-slim

RUN apt-get update && apt-get install -y curl

RUN mkdir -p /campfire/cozy && mkdir /campfire/downloads
WORKDIR /campfire

ARG MINECRAFT_VERSION=1.18.1
ARG PAPER_BUILD=68
ARG SERVER_DOWNLOAD_URL=https://papermc.io/api/v2/projects/paper/versions/$MINECRAFT_VERSION/builds/$PAPER_BUILD/downloads/paper-$MINECRAFT_VERSION-$PAPER_BUILD.jar
RUN curl -L -o /campfire/downloads/paper.jar $SERVER_DOWNLOAD_URL

ARG WORLDEDIT_VERSION=3502099
ARG WORLDEDIT_DOWNLOAD_URL=https://dev.bukkit.org/projects/worldedit/files/$WORLDEDIT_VERSION/download
RUN curl -L -o /campfire/downloads/worldedit.jar $WORLDEDIT_DOWNLOAD_URL

ARG WORLDGUARD_VERSION=3461546
ARG WORLDGUARD_DOWNLOAD_URL=https://dev.bukkit.org/projects/worldguard/files/$WORLDGUARD_VERSION/download
RUN curl -L -o /campfire/downloads/worldguard.jar $WORLDGUARD_DOWNLOAD_URL


ADD configs /campfire/configs

COPY start.sh /campfire/
EXPOSE 25565
VOLUME /campfire/cozy

ENTRYPOINT ["sh", "start.sh"]
