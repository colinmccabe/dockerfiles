FROM archlinux:base-devel-20230101.0.115167

RUN echo 'Server=https://archive.archlinux.org/repos/2023/01/01/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
