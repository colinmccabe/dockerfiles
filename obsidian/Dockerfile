FROM archlinux-colin

USER root
RUN pacman -S --noconfirm \
    obsidian \
  && pacman -Scc --noconfirm

COPY xdg-open-client /usr/local/bin/xdg-open

USER colin
WORKDIR /home/colin

RUN mkdir -p .config/obsidian

RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["obsidian"]
