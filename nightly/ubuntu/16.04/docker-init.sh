#!/bin/sh

DOCKER_FILES_DIR="$HOME/recipes"
echo "Copying files from $DOCKER_FILES_DIR (container) to project directory (host) ..." \
  && cp -r $DOCKER_FILES_DIR/* . \
  && echo "Done."

echo "Adopting Dockerfile for the host UID and GID" \
  && sed -i -r \
    -e "s/HOST_UID=\S*/HOST_UID=$(id -u)/g" \
    -e "s/HOST_GID=\S*/HOST_GID=$(id -g)/g" \
    Dockerfile \
  && echo "Done."
