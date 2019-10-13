FROM eleidan/base:ubuntu-16.04

LABEL maintainer="Oleg Kulyk" \
      description="Rust 1.38.0 based on Ubuntu 16.04" \
      init="docker run -it --rm --user $(id -u) -v $(pwd):/home/phantom/app eleidan/rust:1.38.0-ubuntu-16.04 docker-init.sh" \
      run="docker run -it --rm --user $(id -u) -v $(pwd):/home/phantom/app eleidan/rust:1.38.0-ubuntu-16.04" \
      version="2019-10-14"

WORKDIR $HOME/app

USER root

COPY docker-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-init.sh

USER phantom

### Install Rust
ARG RUST_VERSION=1.38.0
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain ${RUST_VERSION} -y

ENV CARGO_HOME="${HOME}/.cargo" \
    SERVICE_NAME="Rust 1.38.0 on Ubuntu 16.04" \
    USER=phantom

RUN mkdir ${CARGO_HOME}/registry

### Needed for the docker-init.sh script
COPY --chown=phantom:phantom recipes $HOME/recipes

# Let running software installed via 'cargo install'
RUN echo ". ${CARGO_HOME}/env" >> $HOME/.bashrc
