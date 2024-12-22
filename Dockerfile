FROM jupyter/base-notebook:python-3.10

LABEL org.opencontainers.image.authors="Minu Mathew <minum@illinois.edu>, Sandeep Puthanveetil Satheesan <sandeeps@illinois.edu>, Ben Galewsky <bengal1@illinois.edu>"

# set environment variables
ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV CUDA_VERSION=12.2.0
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# install drivers
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    unzip \
    git \
    vim

# TODO: Important - the commented out command is not needed when building this Dockerfile on your local machine. It may be needed for deployment to an instance.
#RUN curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb -o cuda-keyring.deb && \
#    dpkg -i cuda-keyring.deb && \
#    apt-get update && \
#    apt-get install -y --no-install-recommends cuda-cudart-12-2 cuda-compat-12-2 && \
#    rm -rf /var/lib/apt/lists/* && \
#    echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
#    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

# install extra software
COPY --chown=jovyan:users requirements.txt ./
RUN pip install -r requirements.txt

# copy required files
COPY --chown=jovyan:users mlflow/hands_on ./mlflow

COPY --chown=jovyan:users foundation_models/hands_on/SAM_checkpoints ./foundation_models/SAM_checkpoints
# download the SAM model weights 
RUN chmod +x foundation_models/SAM_checkpoints/download_checkpoints.sh && \
    ./foundation_models/SAM_checkpoints/download_checkpoints.sh

COPY --chown=jovyan:users foundation_models/hands_on/.env ./foundation_models/.env
COPY --chown=jovyan:users foundation_models/hands_on/data ./foundation_models/data
COPY --chown=jovyan:users foundation_models/hands_on/notebook_images ./foundation_models/notebook_images

# copy jupyter code last
COPY --chown=jovyan:users foundation_models/hands_on/rag.ipynb ./foundation_models/rag.ipynb
COPY --chown=jovyan:users foundation_models/hands_on/segmentation.ipynb ./foundation_models/segmentation.ipynb

# switch user to jovyan
USER jovyan
