FROM debian:buster-slim

RUN groupadd -g 801 appuser
RUN useradd -m -u 801 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wireshark \
  && rm -rf /var/lib/apt/lists/*

USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["wireshark"]
