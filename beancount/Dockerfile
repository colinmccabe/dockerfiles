FROM debian:bullseye-slim

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    beancount \
    python3-fava \
  && rm -rf /var/lib/apt/lists/*

USER appuser

WORKDIR /home/appuser
RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["fava", "--host", "0.0.0.0"]
