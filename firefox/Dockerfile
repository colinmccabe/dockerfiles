FROM debian:sid-slim

RUN groupadd -g 801 appuser
RUN useradd -m -u 801 -g appuser appuser

RUN apt-get update && apt-get install -y --no-install-recommends \
    firefox \
    ffmpeg \
    fonts-dejavu \
  && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /usr/local/bin/

USER appuser
WORKDIR /home/appuser

COPY ./user-github.js ./user-custom.js ./
RUN cat user-github.js user-custom.js > user.js
RUN mkdir profile

ENTRYPOINT ["entrypoint.sh"]
