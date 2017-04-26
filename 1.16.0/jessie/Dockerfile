FROM eleidan/buildpack-deps:jessie

LABEL maintainer="Oleg Kulyk" \
      description="Rust 1.16.0 based on Debian Jessie" \
      init="docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:1.16.0-jessie docker-init.sh" \
      run="docker run -it --rm -v $(pwd):/home/phantom/app eleidan/rust:1.16.0-jessie bash" \
      version="2017-04-27"

ARG VERSION_MAJOR=1
ARG VERSION_MINOR=16
ARG VERSION_PATCH=0

ENV USER=phantom \
    RUST_VERSION="${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}" \
    SERVICE_NAME="rust:${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}-jessie"

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
COPY docker-init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-init.sh

### Needed for the docker-init.sh script
COPY recipes $HOME/recipes

CMD ["/bin/bash"]
