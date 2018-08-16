FROM eleidan/base:ubuntu-16.04

LABEL maintainer="Oleg Kulyk" \
      description="Rust 1.28.0 based on Ubuntu 16.04" \
      init="docker run -it --rm --user $(id -u) -v $(pwd):/home/phantom/app eleidan/rust:1.28.0-ubuntu-16.04 docker-init.sh" \
      run="docker run -it --rm --user $(id -u) -v $(pwd):/home/phantom/app eleidan/rust:1.28.0-ubuntu-16.04" \
      version="2018-08-16"

ENV CARGO_HOME="${HOME}/.cargo" \
    SERVICE_NAME="Rust 1.28.0 on Ubuntu 16.04" \
    USER=${CONTAINER_USER}

### Install Rust
ARG RUST_VERSION=1.28.0
ARG RUST_ARCHIVE="rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
ARG DOWNLOAD_URL="https://static.rust-lang.org/dist/${RUST_ARCHIVE}"
RUN cd /tmp \
    && curl -fsOSL $DOWNLOAD_URL \
    && curl -s $DOWNLOAD_URL.sha256 | sha256sum -c --status - \
    && tar -xzf $RUST_ARCHIVE --strip-components=1 \
    && ./install.sh \
    && rm -rf *

WORKDIR $HOME/app

COPY docker-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-init.sh

USER ${CONTAINER_USER}

### Needed for the docker-init.sh script
COPY --chown=phantom:phantom recipes $HOME/recipes

# Let running software installed via 'cargo install'
RUN echo "PATH=${CARGO_HOME}/bin:${PATH}" >> $HOME/.bashrc
