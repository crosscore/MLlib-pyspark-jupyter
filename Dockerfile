FROM jupyter/pyspark-notebook

USER root

RUN pip install --no-cache-dir --upgrade nbdime jupyterlab-git && \
    jupyter labextension update --all

USER $NB_UID
