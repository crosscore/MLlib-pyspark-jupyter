FROM jupyter/pyspark-notebook

USER root

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt

RUN pip install --no-cache-dir --upgrade jupyter notebook

USER $NB_UID
