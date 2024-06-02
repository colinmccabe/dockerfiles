FROM archlinux/archlinux:base-devel-20240520.0.237425

RUN echo 'Server=https://archive.archlinux.org/repos/2024/06/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
