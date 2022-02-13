FROM debian:bullseye-slim

RUN groupadd -g 1265 appuser
RUN useradd -m -u 1265 -g appuser appuser

RUN apt-get update &&\
  apt-get -y install --no-install-recommends \
    bind9-dnsutils \
    ca-certificates \
    curl \
    netcat-openbsd &&\
  rm -rf /var/lib/apt/lists/*

USER appuser
WORKDIR /home/appuser

ENTRYPOINT ["bash"]
