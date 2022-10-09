FROM archlinux-colin

RUN pacman -S --noconfirm \
    obsidian \
  && pacman -Scc --noconfirm

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser

COPY xdg-open-client /usr/local/bin/xdg-open

USER appuser
WORKDIR /home/appuser

RUN mkdir -p .config/obsidian

RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["obsidian"]
