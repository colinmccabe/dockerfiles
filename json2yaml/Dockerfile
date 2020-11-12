FROM python:3.8-alpine3.12

RUN addgroup -g 801 appuser
RUN adduser -D -u 801 -G appuser appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"

USER appuser

RUN pip3 install --user --no-cache-dir pyyaml

COPY ./json2yaml ./yaml2json /home/appuser/.local/bin/

RUN mkdir /home/appuser/workdir
WORKDIR /home/appuser/workdir

ENTRYPOINT ["json2yaml"]
