FROM python:3.7-alpine3.12

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"

USER appuser

RUN pip install --user --no-cache-dir beets

WORKDIR /home/appuser
RUN mkdir -p .config/beets
RUN mkdir Music
RUN mkdir workdir

WORKDIR workdir

ENTRYPOINT ["beet"]
