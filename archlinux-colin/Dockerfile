FROM archlinux:base-devel-20241027.0.273886

RUN echo 'Server=https://archive.archlinux.org/repos/2024/11/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
