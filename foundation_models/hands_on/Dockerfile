FROM jupyter/base-notebook:python-3.11

LABEL maintainer="Minu Mathew <minum@illinois.edu> Sandeep Puthanveetil Satheesan <sandeeps@illinois.edu>"
ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

USER root
RUN apt-get update && apt-get install -y unzip git

COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install 'git+https://github.com/facebookresearch/segment-anything-2.git'

USER 1000
COPY .env ./
COPY data ./data
COPY SAM_checkpoints ./SAM_checkpoints
COPY rag.ipynb ./
COPY image_predictor_example.ipynb ./

