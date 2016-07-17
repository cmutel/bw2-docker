FROM jupyter/minimal-notebook

# Some stuff from https://github.com/jupyter/docker-stacks/blob/master/scipy-notebook/Dockerfile
MAINTAINER Chris Mutel <cmutel@gmail.com>

USER root

# libav-tools for matplotlib anim
RUN apt-get update && \
    apt-get install -y --no-install-recommends libav-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER

# Install Python 3 packages
RUN conda install --quiet --yes wheel && \
    conda update --yes pip wheel setuptools && \
    conda install --quiet --yes ipywidgets pandas numexpr matplotlib seaborn scikit-learn cython flask lxml requests nose docopt whoosh xlsxwriter xlrd unidecode psutil && \
    conda install --quiet --yes -c conda-forge scikit-umfpack fiona rasterio rtree pillow shapely && \
    pip install --user --no-cache-dir eight && \
    pip install --user --no-cache-dir brightway2 && \
    pip install --user --no-cache-dir https://bitbucket.org/cmutel/brightway2-regional/get/tip.zip#egg=bw2regional-0.3 && \
    conda clean -tipsy

# Activate ipywidgets extension in the environment that runs the notebook server
RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix

RUN mkdir /home/jovyan/data
RUN mkdir /home/jovyan/notebooks
RUN mkdir /home/jovyan/output

ENV BRIGHTWAY2_DIR /home/jovyan/data
ENV BRIGHTWAY2_OUTPUT_DIR /home/jovyan/output


WORKDIR /home/jovyan/notebooks
