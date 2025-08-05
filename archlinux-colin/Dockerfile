FROM archlinux:base-devel-20250803.0.394512

RUN echo 'Server=https://archive.archlinux.org/repos/2025/08/03/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc

RUN useradd -m colin
USER colin
WORKDIR /home/colin
