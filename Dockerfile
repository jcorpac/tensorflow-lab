FROM tensorflow/tensorflow:latest-gpu-jupyter

# Set the working directory
WORKDIR /tf

# Install additional libraries
RUN apt-get update && apt-get install -y libhdf5-dev git python3 python3-pip

# Copy the requirements.txt file
COPY requirements.txt /tmp

# Install the requirements
RUN pip install --no-cache-dir -r /tmp/requirements.txt
# Install Tensorflow with CUDA support last to ensure that it's not overwritten by other installs.
RUN pip install --no-cache-dir -U tensorflow[and-cuda]

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
