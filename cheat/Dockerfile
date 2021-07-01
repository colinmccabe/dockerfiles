FROM alpine:3.13

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

WORKDIR /usr/local/bin
RUN wget https://github.com/cheat/cheat/releases/download/4.2.0/cheat-linux-amd64.gz \
  && echo '25d64ac3565c6976d3bb8508fb2a3434d7f7a696762735d3103e5bf039338338  cheat-linux-amd64.gz' > SHA256SUMS \
  && sha256sum -c SHA256SUMS \
  && gunzip -c cheat-linux-amd64.gz > cheat \
  && chmod +x cheat

USER appuser
RUN mkdir /home/appuser/cheatsheets
WORKDIR /home/appuser/cheatsheets

ENTRYPOINT ["cheat"]
