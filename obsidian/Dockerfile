FROM archlinux:base-devel-20220109.0.43549

RUN echo 'Server=https://archive.archlinux.org/repos/2022/01/09/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy --noconfirm \
    asar \
    electron13 \
    fuse \
    git \
    hicolor-icon-theme \
  && pacman -Scc --noconfirm

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser

ARG commit=ce79f2ada933b1e91d0ef7a32515408d8b1a08a1
RUN git clone https://aur.archlinux.org/obsidian.git
WORKDIR obsidian
RUN git checkout $commit
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN makepkg -c

USER root
RUN pacman -U --noconfirm *.tar.zst

COPY xdg-open-client /usr/local/bin/xdg-open

USER appuser
WORKDIR /home/appuser

RUN mkdir -p .config/obsidian
COPY obsidian.json .config/obsidian/

RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["obsidian"]
