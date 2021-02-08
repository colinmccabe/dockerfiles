FROM debian:bullseye-slim

RUN groupadd -g 1300 appuser
RUN useradd -m -u 1300 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    pwgen \
  && rm -rf /var/lib/apt/lists/*

USER appuser
WORKDIR /home/appuser

ENTRYPOINT ["pwgen"]
