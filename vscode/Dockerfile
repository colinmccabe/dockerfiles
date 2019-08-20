FROM archlinux-dev:latest

USER root
WORKDIR /
COPY packages .
RUN pacman -Sy --noconfirm - < packages

USER dev
WORKDIR /home/dev

#RUN mkdir -p .local/share/code-server/extensions
#RUN mkdir -p .local/share/code-server/User
#RUN echo '{}' > .local/share/code-server/User/settings.json

RUN pip install --user pip-tools
RUN code --install-extension ms-python.python

WORKDIR project

ENTRYPOINT ["code", "-w", "."]
