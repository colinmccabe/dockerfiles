FROM archlinux:base-devel-20230305.0.131236

RUN echo 'Server=https://archive.archlinux.org/repos/2023/03/05/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy
