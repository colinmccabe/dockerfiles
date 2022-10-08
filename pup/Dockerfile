FROM alpine:3.16

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

WORKDIR /usr/local/bin
ENV PUP_VER=0.4.0
RUN wget -O pup.zip https://github.com/ericchiang/pup/releases/download/v$PUP_VER/pup_v${PUP_VER}_linux_amd64.zip \
  && echo 'ec3d29e9fb375b87ac492c8b546ad6be84b0c0b49dab7ff4c6b582eac71ba01c  pup.zip' > SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && unzip pup.zip \
  && chmod +x pup

USER appuser

ENTRYPOINT ["pup"]
