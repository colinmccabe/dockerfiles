FROM python:3.10-slim-bullseye

RUN groupadd -g 1944 appuser
RUN useradd -m -u 1944 -g appuser appuser

ENV BUILD_DEPS="build-essential libffi-dev"
COPY requirements.txt /
RUN apt-get update &&\
  apt-get -y install --no-install-recommends $BUILD_DEPS &&\
  chown -R appuser:appuser /usr/local &&\
  su appuser -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  find /usr/local -name __pycache__ -prune -exec rm -rf '{}' \+ &&\
  chown -R root:root /usr/local &&\
  apt-get -y autoremove --purge $BUILD_DEPS &&\
  rm -rf /var/lib/apt/lists/*

USER appuser
WORKDIR /home/appuser
RUN mkdir .homeassistant

ENTRYPOINT ["hass"]
