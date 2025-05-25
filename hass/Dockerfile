FROM python:3.13-slim-bookworm

RUN groupadd -g 1944 colin
RUN useradd -m -u 1944 -g colin colin

ENV BUILD_DEPS="build-essential libffi-dev"
COPY requirements.txt /
RUN apt-get update &&\
  apt-get -y install --no-install-recommends $BUILD_DEPS &&\
  chown -R colin:colin /usr/local &&\
  su colin -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  find /usr/local -name __pycache__ -prune -exec rm -rf '{}' \+ &&\
  chown -R root:root /usr/local &&\
  apt-get -y autoremove --purge $BUILD_DEPS &&\
  rm -rf /var/lib/apt/lists/*

USER colin
WORKDIR /home/colin
RUN mkdir .homeassistant

ENTRYPOINT ["hass"]
