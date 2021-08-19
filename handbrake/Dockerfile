FROM debian:bullseye-slim

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

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
  && apt-get install -y --no-install-recommends \
    handbrake \
    libaacs0 \
    libbluray-bin \
  && rm -rf /var/lib/apt/lists/*

USER appuser
RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["handbrake"]
