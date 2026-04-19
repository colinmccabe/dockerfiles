FROM vnc

USER root
RUN pacman -S --noconfirm \
    kicad \
    kicad-library \
    kicad-library-3d \
  && pacman -Scc --noconfirm && rm -rf /var/cache/pacman/pkg/*

USER colin

RUN mkdir -p .config/openbox
COPY openbox .config/openbox
