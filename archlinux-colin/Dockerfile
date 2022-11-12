FROM archlinux:base-devel-20221106.0.100148

RUN echo 'Server=https://archive.archlinux.org/repos/2022/11/06/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
