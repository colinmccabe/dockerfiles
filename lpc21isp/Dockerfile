# Build

FROM alpine:3.19 AS build

RUN apk add --no-cache gcc make libc-dev

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser
USER appuser

RUN mkdir /home/appuser/build
WORKDIR /home/appuser/build

ENV SOURCE_URL=https://github.com/capiman/lpc21isp/archive/cf89d0b122ef02358e0f130b8f32cb804c11a54e.tar.gz
RUN wget -O lpc21isp.tar.gz $SOURCE_URL
RUN echo '9981cd4a271f8d07d42bc49ca6ab18a976a1861142c4c06b79f2b015378c1f42  lpc21isp.tar.gz' \
  | sha256sum -c
RUN tar -xf lpc21isp.tar.gz --strip-components=1

RUN make clean all
RUN chmod +x lpc21isp


# Run

FROM alpine:3.19

COPY --from=build /home/appuser/build/lpc21isp /usr/local/bin/

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser
USER appuser

ENTRYPOINT ["lpc21isp"]
