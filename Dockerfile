FROM fedora

RUN dnf install -y libreoffice-core pandoc texlive-base curl && dnf clean all
