# Supplementary Materials for Hands-On Lab Sessions: AI Workflows and Foundation Models in the Cyber2A Workshop 2024 - AI for Arctic Research
[Minu Mathew](mailto:minum@illinos.edu), [Sandeep Puthanveetil Satheesan](mailto:sandeeps@illinois.edu), and [Ben Galewsky](mailto:bengal1@illinois.edu)

National Center for Supercomputing Applications, University of Illinois Urbana-Champaign

## Cyber2A Workshop 2024

This repository contains the supplementary materials for the hands-on lab sessions in the Cyber2A Workshop 2024 - AI for Arctic Research conducted at Santa Barbara, California in October 21-25 2024. For more details about the workshop, visit [Cyber2A Workshop 2024](https://cyber2a.github.io/workshop/). 
The course materials from the Cyber2A Workshop 2024 are available at [Cyber2A Course](https://cyber2a.github.io/cyber2a-course/).

## Installation instructions

### Prerequisites
Docker should be installed and running on your machine. If not, you can download and install it from [here](https://docs.docker.com/get-started/get-docker/).

### Clone the repository
```bash
git clone https://github.com/ncsa/cyber2a-workshop.git
cd cyber2a-workshop
```

### Build the Docker image
```bash
docker build -t cyber2a-workshop .
```

### Run the Docker container
```bash
docker run -it -p 8888:8888 cyber2a-workshop
```

### Access Jupyter Notebook
View the logs of the `docker run` command above, and open your browser and go to `http://localhost:8888`. You will see the Jupyter Notebooks in the browser page.
