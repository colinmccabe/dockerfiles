FROM archlinux:base-devel-20211121.0.39613

RUN echo 'Server=https://archive.archlinux.org/repos/2021/11/21/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy --noconfirm \
    asar \
    electron13 \
    fuse \
    git \
    hicolor-icon-theme \
  && pacman -Scc --noconfirm

RUN sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar.zst'/" /etc/makepkg.conf

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
