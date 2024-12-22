# Supplementary materials for the hands-on lab sessions on AI Workflows and Foundation Models as part of the Cyber2A Workshop 2024: AI for Arctic Research

Authors:
Ben Galewsky <bengal1@illinois.edu>, Sandeep Puthanveetil Satheesan <sandeeps@illinois.edu>, Minu Mathew <minum@illinos.edu>

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

## Workshop Details

For more details about the concluded workshop, visit [Cyber2A Workshop 2024](https://cyber2a.github.io/cyber2a-workshop/).
