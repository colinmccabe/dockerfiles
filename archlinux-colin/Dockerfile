FROM archlinux/archlinux:base-devel-20240501.0.232969

RUN echo 'Server=https://archive.archlinux.org/repos/2024/05/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc
