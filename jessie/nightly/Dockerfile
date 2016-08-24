FROM eleidan/buildpack-deps:jessie
MAINTAINER Oleg Kulyk

ENV USER=root \
    SERVICE_NAME="rust:jessie-nightly" \
    RUST_VERSION=nightly \
    APP_DIR=/usr/scr/app \
    CARGO_HOME=$APP_DIR/.cargo
ARG RUST_ARCHIVE=rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz \
    DOWNLOAD_URL=https://static.rust-lang.org/dist/$RUST_ARCHIVE

RUN cd /tmp \
    && curl -fsOSL $DOWNLOAD_URL \
    && curl -s $DOWNLOAD_URL.sha256 | sha256sum -c --status - \
    && tar -xzf $RUST_ARCHIVE --strip-components=1 \
    && ./install.sh \
    && rm -rf *

WORKDIR /usr/scr/app
