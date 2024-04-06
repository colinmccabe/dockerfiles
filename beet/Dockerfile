FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 appuser
RUN useradd -m -u 1000 -g appuser appuser

USER appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"
WORKDIR /home/appuser

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
  -r requirements.txt
RUN rm requirements.txt

RUN mkdir -p .config/beets
RUN mkdir Music
RUN mkdir workdir

WORKDIR workdir

ENTRYPOINT ["beet"]
