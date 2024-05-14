FROM jupyter/pyspark-notebook

USER root

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt

RUN pip install --no-cache-dir --upgrade jupyter notebook

# JupyterLab Dark Mode settings
ENV JUPYTER_CONFIG_DIR=/home/$NB_USER/.jupyter
RUN mkdir -p $JUPYTER_CONFIG_DIR/lab/user-settings/@jupyterlab/apputils-extension \
    && echo '{"theme": "JupyterLab Dark"}' > $JUPYTER_CONFIG_DIR/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings \
    && chown -R $NB_UID:users $JUPYTER_CONFIG_DIR

USER $NB_UID

CMD ["start-notebook.sh"]
