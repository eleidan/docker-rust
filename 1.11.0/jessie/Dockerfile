FROM eleidan/buildpack-deps:jessie
MAINTAINER Oleg Kulyk

ARG VERSION_MAJOR=1
ARG VERSION_MINOR=11
ARG VERSION_PATCH=0

ENV USER=phantom \
    SERVICE_NAME="rust:${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}-jessie" \
    RUST_VERSION=$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH

ARG RUST_ARCHIVE=rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz
ARG DOWNLOAD_URL=https://static.rust-lang.org/dist/$RUST_ARCHIVE

### Install Rust
RUN cd /tmp \
    && curl -fsOSL $DOWNLOAD_URL \
    && curl -s $DOWNLOAD_URL.sha256 | sha256sum -c --status - \
    && tar -xzf $RUST_ARCHIVE --strip-components=1 \
    && ./install.sh \
    && rm -rf *

WORKDIR /home/${USER}/app

### Provide end users with handy init script
# Can be used as follows:
#   docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:<version>-<flavor> docker-init.sh
# NOTE: Replace <version> with actual ruby version,
#       and <flavor> with actual linux distro flavor.
# EXAMPLE:
# docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:1.11-jessie docker-init.sh
COPY docker-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-init.sh

### Needed for the docker-init.sh script
COPY recipes $HOME/recipes

CMD ["/bin/bash"]
