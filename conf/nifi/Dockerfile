FROM apache/nifi:latest

USER root

RUN apt-get update && apt-get install -y sudo && echo "nifi   ALL = NOPASSWD: ALL" >> /etc/sudoers && usermod -u 0 -g 0 -o nifi

USER nifi
