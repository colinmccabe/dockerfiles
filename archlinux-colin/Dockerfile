FROM archlinux:base-devel-20231001.0.182270

RUN echo 'Server=https://archive.archlinux.org/repos/2023/10/04/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
