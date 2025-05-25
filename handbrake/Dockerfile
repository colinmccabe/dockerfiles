FROM debian:bookworm-slim

RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin

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

USER colin
RUN mkdir /home/colin/workdir
WORKDIR /home/colin/workdir

ENTRYPOINT ["handbrake"]
