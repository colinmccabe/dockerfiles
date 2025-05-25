FROM c-dev:latest

USER root
RUN pacman -S --noconfirm \
    avr-libc \
    avr-gcc \
    avrdude \
  && pacman -Scc --noconfirm

USER colin
WORKDIR /home/colin/project

ENTRYPOINT ["code", "-w", "."]
