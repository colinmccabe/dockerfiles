# Build

FROM alpine:3.21 AS build

RUN apk add --no-cache gcc make libc-dev libusb-dev

RUN addgroup -g 3879 colin
RUN adduser -D -u 3879 -G colin colin
USER colin

RUN mkdir /home/colin/build
WORKDIR /home/colin/build

ENV SOURCE_URL=https://github.com/csete/fcdctl/archive/b174137313f0fc6076a42ad3b6eca130c2ff3ab4.tar.gz
RUN wget -O fcdctl.tar.gz $SOURCE_URL
RUN echo '630b129b52f3806ac0276a259991e3b658b4bf079b667555d1e564e6b80435c0  fcdctl.tar.gz' \
  | sha256sum -c
RUN tar -xf fcdctl.tar.gz --strip-components=1

RUN make fcdpp
RUN chmod +x fcdctl


# Run

FROM alpine:3.21

RUN apk add --no-cache libusb

COPY --from=build /home/colin/build/fcdctl /usr/local/bin/

RUN addgroup -g 3879 colin
RUN adduser -D -u 3879 -G colin colin
USER colin

ENTRYPOINT ["fcdctl"]
