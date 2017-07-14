FROM eleidan/buildpack-deps:xenial

LABEL maintainer="Oleg Kulyk" \
      description="Rust nightly based on Ubuntu 16.04" \
      init="docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:nightly-xenial docker-init.sh" \
      run="docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:nightly-xenial" \
      version="2017-07-15"

ENV USER=phantom \
    RUST_VERSION="nightly" \
    PATH="$PATH:$HOME/app/.cargo/bin" \
    SERVICE_NAME="rust:nightly-xenial"

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
