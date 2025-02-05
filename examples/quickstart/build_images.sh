# build Docker images for demo containers
# this must be run with the working directory set to the directory
# containing the docker-compose.yml file.

docker-compose build \
    --build-arg MLFLOW_VERSION=${MLFLOW_VERSION:-1.2.0} \
    --build-arg MLFLOW_VERSION_TO_INSTALL=${MLFLOW_VERSION_TO_INSTALL} \
