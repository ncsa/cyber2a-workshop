FROM jupyter/base-notebook:python-3.10

LABEL maintainer="Minu Mathew <minum@illinois.edu> Sandeep Puthanveetil Satheesan <sandeeps@illinois.edu> Ben Galewsky <bengal1@illinois.edu>"

# nvidia-container-runtime
ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV CUDA_VERSION=12.2.0
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# install drivers
USER root
RUN curl -fsSLO https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb && \
    dpkg -i cuda-keyring_1.0-1_all.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends cuda-cudart-12-2 cuda-compat-12-2 vim && \
    rm -rf /var/lib/apt/lists/* && \
    echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

RUN apt-get install -y unzip git 

# install extra software
USER jovyan
COPY requirements.txt ./
RUN pip install -r requirements.txt

# copy required files
COPY foundation_models/hands_on ./foundation_models
COPY mlflow/hands_on ./mlflow


