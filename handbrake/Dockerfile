FROM debian:buster-slim

RUN groupadd -g 801 appuser
RUN useradd -m -u 801 -g appuser appuser

# libdvdpkg/libdvdcss for encrypted DVDs
RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
      libdvd-pkg \
  && rm -rf /var/lib/apt/lists/*
RUN DEBIAN_FRONTEND=noninteractive \
  dpkg-reconfigure libdvd-pkg

RUN apt-get update \
  && apt-get install -y --no-install-recommends handbrake \
  && rm -rf /var/lib/apt/lists/*

USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["handbrake"]
