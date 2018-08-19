FROM fedora

RUN dnf install -y libreoffice pandoc texlive-base curl file && dnf clean all
