FROM archlinux:base-devel-20260301.0.494762

RUN echo 'Server=https://archive.archlinux.org/repos/2026/03/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
