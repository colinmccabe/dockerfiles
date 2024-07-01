FROM archlinux/archlinux:base-devel-20240627.0.243529

RUN echo 'Server=https://archive.archlinux.org/repos/2024/07/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
