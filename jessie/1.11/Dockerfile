FROM eleidan/buildpack-deps:jessie
MAINTAINER Oleg Kulyk

ARG VERSION_MAJOR=1
ARG VERSION_MINOR=11
ARG VERSION_PATCH=0

ENV USER=root \
    SERVICE_NAME="rust:jessie-$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH" \
    RUST_VERSION=$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH

ARG RUST_ARCHIVE=rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz
ARG DOWNLOAD_URL=https://static.rust-lang.org/dist/$RUST_ARCHIVE

RUN cd /tmp \
    && curl -fsOSL $DOWNLOAD_URL \
    && curl -s $DOWNLOAD_URL.sha256 | sha256sum -c --status - \
    && tar -xzf $RUST_ARCHIVE --strip-components=1 \
    && ./install.sh \
    && rm -rf *

WORKDIR /usr/src/app
