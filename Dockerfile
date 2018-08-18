FROM fedora

RUN dnf install -y libreoffice pandoc texlive-base curl && dnf clean all
