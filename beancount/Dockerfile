FROM alpine:3.12

RUN addgroup -g 801 appuser
RUN adduser -D -u 801 -G appuser appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"

RUN apk add --no-cache python3 py3-pip
RUN apk add --no-cache beancount

USER appuser

RUN pip3 install --user --no-cache-dir fava

WORKDIR /home/appuser
RUN mkdir data
WORKDIR data

ENTRYPOINT ["fava", "--host", "0.0.0.0"]
