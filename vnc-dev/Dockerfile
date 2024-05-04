FROM archlinux-dev

USER root
RUN pacman -S --noconfirm \
    xorg-server \
    xorg-xinit \
    openbox \
    tigervnc \
    ttf-dejavu \
    xorg-xrandr \
    xterm \
  && pacman -Scc --noconfirm

RUN echo ':0=dev' >> /etc/tigervnc/vncserver.users

USER dev
WORKDIR /home/dev

RUN mkdir .vnc

RUN echo password | vncpasswd -f > .vnc/passwd &&\
  chmod 600 .vnc/passwd

RUN echo -e "#!/bin/sh\nexec openbox-session" > .vnc/xstartup && \
    chmod +x .vnc/xstartup

RUN mkdir -p .config/openbox
COPY openbox .config/openbox

COPY vnc-config .vnc/config

ENTRYPOINT ["vncserver", ":0"]
