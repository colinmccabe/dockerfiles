FROM archlinux:base-devel-20240728.0.249973

RUN echo 'Server=https://archive.archlinux.org/repos/2024/07/31/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
