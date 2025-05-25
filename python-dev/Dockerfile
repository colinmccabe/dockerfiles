FROM code-server:latest

USER root
RUN pacman -S --noconfirm --needed \
    mypy \
    python \
    python-ruff \
    python-pip \
    uv \
  && pacman -Scc --noconfirm

USER colin

RUN code-server --install-extension ms-python.python
RUN code-server --install-extension ms-python.mypy-type-checker
RUN code-server --install-extension charliermarsh.ruff

ENTRYPOINT ["code-server", "."]
