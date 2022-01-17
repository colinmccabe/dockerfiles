FROM archlinux:base-20220109.0.43549

RUN echo 'Server=https://archive.archlinux.org/repos/2022/01/09/$repo/os/$arch' \
  > /etc/pacman.d/mirrorlist

RUN pacman -Sy --noconfirm --needed \
    home-assistant \
  && pacman -Scc --noconfirm

RUN useradd -Um -u 1944 appuser
USER appuser

ENTRYPOINT ["hass", "--runner"]
