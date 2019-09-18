#!/bin/bash

docker build \
    --build-arg MLFLOW_VERSION=${MLFLOW_VERSION:-1.2.0} \
    --build-arg MLFLOW_VERSION_TO_INSTALL=${MLFLOW_VERSION_TO_INSTALL} \
    -t mlflow_r_demo .

