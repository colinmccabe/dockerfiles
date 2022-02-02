FROM python:3.9-slim-bullseye

RUN groupadd -g 1944 appuser
RUN useradd -m -u 1944 -g appuser appuser

RUN chown -R appuser:appuser /usr/local
ENV BUILD_DEPS="build-essential libffi-dev"
COPY requirements.txt /
RUN apt-get update &&\
  apt-get -y install --no-install-recommends $BUILD_DEPS &&\
  su appuser -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  find /usr/local -name __pycache__ -prune -exec rm -rf '{}' \+ &&\
  chown -R root:root /usr/local &&\
  apt-get -y autoremove --purge $BUILD_DEPS &&\
  rm -rf /var/lib/apt/lists/* &&\
  chown -R root:root /usr/local

USER appuser
WORKDIR /home/appuser
RUN mkdir .homeassistant

ENTRYPOINT ["hass", "--runner"]
