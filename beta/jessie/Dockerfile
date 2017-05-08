FROM eleidan/buildpack-deps:jessie

LABEL maintainer="Oleg Kulyk" \
      description="Rust beta based on Debian Jessie" \
      init="docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:beta-jessie docker-init.sh" \
      run="docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:beta-jessie" \
      version="2017-05-09"

ENV USER=phantom \
    RUST_VERSION=beta \
    SERVICE_NAME="rust:beta-jessie"

ARG RUST_ARCHIVE="rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
ARG DOWNLOAD_URL="https://static.rust-lang.org/dist/${RUST_ARCHIVE}"

### Install Rust
RUN cd /tmp \
    && curl -fsOSL $DOWNLOAD_URL \
    && curl -s $DOWNLOAD_URL.sha256 | sha256sum -c --status - \
    && tar -xzf $RUST_ARCHIVE --strip-components=1 \
    && ./install.sh \
    && rm -rf *

WORKDIR $HOME/app

COPY docker-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-init.sh

### Needed for the docker-init.sh script
COPY recipes $HOME/recipes
