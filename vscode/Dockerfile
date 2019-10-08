FROM archlinux-dev:latest

USER root
WORKDIR /
COPY packages .
RUN pacman -Sy --noconfirm --needed - < packages \
  && pacman -Scc --noconfirm

USER dev
WORKDIR /home/dev

RUN pip install --user pip-tools
RUN code --install-extension ms-python.python

WORKDIR project

ENTRYPOINT ["code", "-w", "."]
