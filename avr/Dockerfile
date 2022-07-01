FROM c-dev:latest

USER root
RUN pacman -Syu --noconfirm \
    avr-libc \
    avr-gcc \
    avrdude \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev/project

ENTRYPOINT ["code", "-w", "."]
