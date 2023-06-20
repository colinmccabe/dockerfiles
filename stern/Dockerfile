FROM debian:bookworm-slim

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin
RUN curl -L https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 > stern
RUN echo 'e0b39dc26f3a0c7596b2408e4fb8da533352b76aaffdc18c7ad28c833c9eb7db  stern' > SHA256SUMS
RUN sha256sum -c SHA256SUMS
RUN chmod 755 stern

COPY ./entrypoint.sh .

USER appuser
WORKDIR /home/appuser

ENTRYPOINT ["entrypoint.sh"]
