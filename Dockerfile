FROM debian

# Disable prompts on apt-get install
ENV DEBIAN_FRONTEND noninteractive

# Install latest stable LibreOffice
RUN apt-get update -qq \
    && apt-get install -y -q libreoffice \
    && apt-get remove -q -y libreoffice-gnome \
    && apt-get install -y -q texlive pandoc curl

# Cleanup after apt-get commands
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*.deb /var/cache/apt/*cache.bin

# Create user 'converter'
RUN useradd --create-home --shell /bin/bash converter \
    # Give user right to run libreoffice binary
    && chown converter:converter /usr/bin/libreoffice \
    # Give user right to run pandoc binary
    && chown converter:converter /usr/bin/pandoc

USER converter
WORKDIR /home/converter

