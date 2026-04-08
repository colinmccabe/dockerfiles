FROM python:3.14-slim-trixie

# python-kasa needs PST8PDT but this was removed from tzdata in trixie
RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles \
  /usr/share/zoneinfo/PST8PDT

RUN groupadd -g 14609 colin
RUN useradd -m -u 14609 -g colin colin

COPY requirements.txt .
RUN chown -R colin:colin /usr/local &&\
  su colin -c 'pip install --no-cache-dir --require-hashes -r /requirements.txt' &&\
  chown -R root:root /usr/local

ENTRYPOINT ["kasa"]
