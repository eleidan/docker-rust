FROM eleidan/base:ubuntu-16.04

LABEL maintainer="Oleg Kulyk" \
      description="Rust beta based on Ubuntu 16.04" \
      init="docker run -it --rm --user $(id -u) -v $(pwd):/home/phantom/app eleidan/rust:beta-ubuntu-16.04 docker-init.sh" \
      run="docker run -it --rm --user $(id -u) -v $(pwd):/home/phantom/app eleidan/rust:beta-ubuntu-16.04" \
      version="2018-08-17"

WORKDIR $HOME/app

USER root

COPY docker-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-init.sh

USER ${CONTAINER_USER}

### Install Rust
ARG RUST_VERSION=beta
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain ${RUST_VERSION} -y

ENV CARGO_HOME="${HOME}/.cargo" \
    SERVICE_NAME="Rust beta on Ubuntu 16.04" \
    USER=${CONTAINER_USER}

RUN mkdir ${CARGO_HOME}/registry

### Needed for the docker-init.sh script
COPY --chown=phantom:phantom recipes $HOME/recipes

# Let running software installed via 'cargo install'
RUN echo ". ${CARGO_HOME}/env" >> $HOME/.bashrc
