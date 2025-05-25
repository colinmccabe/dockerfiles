FROM vnc

USER root
RUN pacman -S --noconfirm \
    kicad \
    kicad-library \
  && pacman -Scc --noconfirm

USER colin

RUN mkdir -p .config/openbox
COPY openbox .config/openbox
