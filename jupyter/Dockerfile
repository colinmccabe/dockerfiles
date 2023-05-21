FROM jupyter/base-notebook:2023-05-15

COPY requirements.txt .
RUN pip install --user --no-cache-dir --require-hashes \
  --no-warn-script-location \
  -r requirements.txt
RUN rm requirements.txt

WORKDIR /home/jovyan/work
