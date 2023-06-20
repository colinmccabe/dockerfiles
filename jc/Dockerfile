FROM python:3.11-slim-bookworm

ARG UID=3360
RUN groupadd -g $UID appuser
RUN useradd -m -u $UID -g appuser appuser

USER appuser
WORKDIR /home/appuser
ENV PATH "/home/appuser/.local/bin:${PATH}"

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
  -r requirements.txt
RUN rm requirements.txt

ENTRYPOINT ["jc"]
