FROM python:3.13-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 colin
RUN useradd -m -u 1000 -g colin colin
USER colin
ENV PATH "/home/colin/.local/bin:${PATH}"
WORKDIR /home/colin

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
  -r requirements.txt
RUN rm requirements.txt

RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["yt-dlp"]
