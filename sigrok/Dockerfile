FROM archlinux-colin

RUN pacman -S --noconfirm \
    ttf-dejavu \
    sigrok-cli \
    sigrok-firmware-fx2lafw \
    pulseview \
  && pacman -Scc --noconfirm

RUN useradd -m appuser
USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

# https://bugreports.qt.io/browse/QTBUG-77922
ENV QT_QUICK_BACKEND=software

ENTRYPOINT ["pulseview"]
