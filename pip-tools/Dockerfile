FROM python:3.8-alpine3.13

RUN addgroup -g 1000 appuser
RUN adduser -D -u 1000 -G appuser appuser

USER appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"
WORKDIR /home/appuser

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
  -r requirements.txt
RUN rm requirements.txt

RUN mkdir workdir
WORKDIR workdir

ENTRYPOINT ["pip-tools"]
