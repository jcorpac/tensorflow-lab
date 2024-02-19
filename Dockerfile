FROM nvidia/cuda:12.3.1-base-ubuntu22.04

# Set the working directory
WORKDIR /tf

# Install additional libraries
RUN apt-get update && apt-get install -y libhdf5-dev git python3 python3-pip

# Copy the requirements.txt file
COPY requirements.txt /tmp

# Install the requirements
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
