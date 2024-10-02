FROM archlinux:base-devel-20240929.0.266368

RUN echo 'Server=https://archive.archlinux.org/repos/2024/10/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc
