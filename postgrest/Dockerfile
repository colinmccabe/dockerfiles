FROM alpine:3.12

RUN addgroup -g 801 appuser
RUN adduser -D -u 801 -G appuser appuser

ENV POSTGREST_VER=7.0.1
RUN wget -O - "https://github.com/PostgREST/postgrest/releases/download/v$POSTGREST_VER/postgrest-v$POSTGREST_VER-linux-x64-static.tar.xz" \
  | tar -xJ -C /usr/local/bin/

USER appuser
WORKDIR /home/appuser

ENTRYPOINT ["postgrest", "postgrest.conf"]
