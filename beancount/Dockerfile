FROM python:3.13-slim-bookworm

RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin

RUN chown -R colin:colin /usr/local
ENV BUILD_DEPS="build-essential"
COPY requirements.txt /
RUN apt-get update &&\
  apt-get -y install --no-install-recommends $BUILD_DEPS &&\
  su colin -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  find /usr/local -name __pycache__ -prune -exec rm -rf '{}' \+ &&\
  chown -R root:root /usr/local &&\
  apt-get -y autoremove --purge $BUILD_DEPS &&\
  rm -rf /var/lib/apt/lists/* &&\
  chown -R root:root /usr/local

USER colin
RUN mkdir /home/colin/workdir
WORKDIR /home/colin/workdir

ENTRYPOINT ["fava", "--host", "0.0.0.0"]
