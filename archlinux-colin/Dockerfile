FROM archlinux:base-devel-20250302.0.316047

RUN echo 'Server=https://archive.archlinux.org/repos/2025/03/02/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy &&\
  pacman --noconfirm -Scc
