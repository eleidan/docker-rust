#!/usr/bin/env bash

# Copy existing one as a base for another version
VER=$1
mkdir $VER
cp -R 1.16.0/* $VER/

SEMVER_PATTERN="[0-9]+\.[0-9]+\.[0-9]+"

TARGET_FILE="${VER}/jessie/Dockerfile"
sed -i -r \
    -e "s/Rust ${SEMVER_PATTERN}/Rust ${VER}/g" \
    -e "s/rust:${SEMVER_PATTERN}/rust:${VER}/g" \
    -e "s/RUST_VERSION=${SEMVER_PATTERN}/RUST_VERSION=${VER}/g" \
    -e "s/version=\S*/version=\"$(date +"%F")\"/g" \
    ${TARGET_FILE}

TARGET_FILE="${VER}/jessie/recipes/docker-compose.yml"
sed -i -r \
    -e "s/rust:${SEMVER_PATTERN}/rust:${VER}/g" \
    ${TARGET_FILE}
