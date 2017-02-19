FROM eleidan/buildpack-deps:jessie
MAINTAINER Oleg Kulyk

ENV RUST_VERSION="beta" \
    USER=phantom
ENV HOME=/home/${USER} \
    SERVICE_NAME="rust:${RUST_VERSION}-jessie"

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

### Provide end users with handy init script
# Can be used as follows:
#   docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:<version>-<flavor> docker-init.sh
# NOTE: Replace <version> with actual ruby version,
#       and <flavor> with actual linux distro flavor.
# EXAMPLE:
# docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:beta-jessie docker-init.sh
COPY docker-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-init.sh

### Needed for the docker-init.sh script
COPY recipes $HOME/recipes

CMD ["/bin/bash"]
