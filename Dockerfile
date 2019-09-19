#FROM continuumio/miniconda:latest

FROM debian:latest

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

#RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
RUN sed -i -s '/debian jessie-updates main/d' /etc/apt/sources.list
RUN echo "deb http://archive.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN echo "Acquire::Check-Valid-Until false;" >/etc/apt/apt.conf.d/10-nocheckvalid
RUN echo 'Package: *\nPin: origin "archive.debian.org"\nPin-Priority: 500' >/etc/apt/preferences.d/10-archive-pin

RUN apt-get -q update --fix-missing && \
    apt-get install -q -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion default-libmysqlclient-dev build-essential curl python-pip cmake && \
    apt-get clean

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

WORKDIR /app

ADD . /app

RUN apt-get -q update -y && \
    pip install --no-cache-dir -r dev-requirements.txt && \
    pip install --no-cache-dir -r test-requirements.txt  && \
    pip install --no-cache-dir -e . && \
    apt-get install -y gnupg && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    cd mlflow/server/js && \
    npm install && \
    npm run build
