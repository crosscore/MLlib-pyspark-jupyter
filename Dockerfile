FROM jupyter/pyspark-notebook

USER root

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt

USER $NB_UID
