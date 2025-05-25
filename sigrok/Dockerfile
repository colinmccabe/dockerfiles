FROM archlinux-colin

RUN pacman -S --noconfirm \
    ttf-dejavu \
    sigrok-cli \
    sigrok-firmware-fx2lafw \
    pulseview \
  && pacman -Scc --noconfirm

RUN useradd -m colin
USER colin
RUN mkdir /home/colin/workdir
WORKDIR /home/colin/workdir

# https://bugreports.qt.io/browse/QTBUG-77922
ENV QT_QUICK_BACKEND=software

ENTRYPOINT ["pulseview"]
