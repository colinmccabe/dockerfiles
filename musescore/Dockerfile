FROM debian:bookworm-slim

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

RUN apt-get update \
  && apt-get install -y --no-install-recommends pulseaudio \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
  && apt-get install -y --no-install-recommends musescore \
  && rm -rf /var/lib/apt/lists/*

USER appuser
ENV SCORE_DIR=/home/appuser/Documents/MuseScore2/Scores
RUN mkdir -p $SCORE_DIR
WORKDIR $SCORE_DIR

# https://bugreports.qt.io/browse/QTBUG-77922
ENV QT_QUICK_BACKEND=software

ENTRYPOINT ["musescore"]
