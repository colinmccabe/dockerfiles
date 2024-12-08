FROM archlinux:base-devel-20241201.0.284684

RUN echo 'Server=https://archive.archlinux.org/repos/2024/12/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
