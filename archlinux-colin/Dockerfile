FROM archlinux:base-devel-20261018.0.612668

RUN echo 'Server=https://archive.archlinux.org/repos/2026/10/24/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc && rm -rf /var/cache/pacman/pkg/*

RUN useradd -m colin
USER colin
WORKDIR /home/colin
