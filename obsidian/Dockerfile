FROM archlinux:base-devel-20210822.0.32033

RUN echo 'Server=https://archive.archlinux.org/repos/2021/08/22/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu \
  asar \
  electron \
  fuse \
  git \
  hicolor-icon-theme

RUN sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar.zst'/" /etc/makepkg.conf

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser

ARG commit=64121a9ac534c55cfbf701b9c42385244da5aa81
RUN git clone https://aur.archlinux.org/obsidian.git
WORKDIR obsidian
RUN git checkout $commit
RUN makepkg --verifysource --noextract --noprepare --nobuild
RUN makepkg -c

USER root
RUN pacman --noconfirm -U *.tar.zst

USER appuser
WORKDIR /home/appuser

RUN mkdir -p .config/obsidian
COPY obsidian.json .config/obsidian/

RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["obsidian"]
