#!/bin/bash

docker build \
    --build-arg MLFLOW_VERSION=${MLFLOW_VERSION:-1.2.0} \
    -t mlflow_py_demo .
