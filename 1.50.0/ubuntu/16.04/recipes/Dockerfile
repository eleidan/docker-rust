FROM eleidan/rust:1.50.0-ubuntu-16.04

USER root

### Adopt container user for the host UID and GID
ARG HOST_UID=1000
ARG HOST_GID=1000
RUN usermod -u ${HOST_UID} phantom
RUN groupmod -g ${HOST_GID} phantom
RUN chown phantom:phantom ${HOME}

USER phantom

# Uncomment lines below to add clippy and rustfmt
# RUN rustup component add clippy
# RUN rustup component add rustfmt
