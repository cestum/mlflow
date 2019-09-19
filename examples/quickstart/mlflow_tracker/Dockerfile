#FROM continuumio/miniconda
FROM base_mlflow:dev

#ARG MLFLOW_VERSION
#ARG MLFLOW_VERSION_TO_INSTALL

RUN echo "\n###\n# BUILDING mlflow_server image with mlflow \n###"

###
# uncomment this section if mlflow version is avaialble on pypy.org install
####
# Add Postgres SQL specific packages
RUN pip install sqlalchemy==1.3.0 psycopg2-binary

