FROM vnc-dev

USER root
RUN pacman -S --noconfirm \
    kicad \
    kicad-library \
  && pacman -Scc --noconfirm

USER dev

RUN mkdir -p .config/openbox
COPY openbox .config/openbox
