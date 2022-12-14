FROM archlinux:base-devel-20221204.0.107760

RUN echo 'Server=https://archive.archlinux.org/repos/2022/12/05/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
