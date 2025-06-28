FROM python:3.13-slim-bookworm

RUN groupadd -g 19476 colin
RUN useradd -m -u 19476 -g colin colin

COPY requirements.txt .
RUN chown -R colin:colin /usr/local &&\
  su colin -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  chown -R root:root /usr/local

ENTRYPOINT ["xlsx2csv"]
