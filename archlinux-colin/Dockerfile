FROM archlinux:base-devel-20260607.0.541780

RUN echo 'Server=https://archive.archlinux.org/repos/2026/06/07/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Syu &&\
  pacman --noconfirm -Scc && rm -rf /var/cache/pacman/pkg/*

RUN useradd -m colin
USER colin
WORKDIR /home/colin
