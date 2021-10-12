FROM archlinux:base-devel-20210822.0.32033

RUN echo 'Server=https://archive.archlinux.org/repos/2021/08/22/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm \
    asar \
    electron \
    fuse \
    git \
    hicolor-icon-theme \
  && pacman -Scc --noconfirm

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
RUN pacman -U --noconfirm *.tar.zst

COPY xdg-open-client /usr/local/bin/xdg-open

USER appuser
WORKDIR /home/appuser

RUN mkdir -p .config/obsidian
COPY obsidian.json .config/obsidian/

RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["obsidian"]
