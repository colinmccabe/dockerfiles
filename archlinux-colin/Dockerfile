FROM archlinux:base-devel-20240101.0.204074

RUN echo 'Server=https://archive.archlinux.org/repos/2024/01/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc
