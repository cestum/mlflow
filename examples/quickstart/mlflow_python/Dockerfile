#FROM continuumio/anaconda3:latest
FROM base_mlflow:dev

#ARG MLFLOW_VERSION_TO_INSTALL

RUN echo "\n###\n# BUILDING mlflow_python image with mlflow\n###"

#
#  install xgboost 
#
#  https://anaconda.org/conda-forge/xgboost
#
RUN conda install -c conda-forge xgboost
RUN pip install --no-cache-dir jupyter jupyter-client

# 
# install mlflow
#
#RUN pip install ${MLFLOW_VERSION_TO_INSTALL}
