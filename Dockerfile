FROM tensorflow/tensorflow:latest-gpu-jupyter

# Set the working directory
WORKDIR /tf

# Install additional libraries
RUN apt-get update && apt-get install -y libhdf5-dev

# Copy the requirements.txt file
COPY requirements.txt /

# Install the requirements
RUN pip install --no-cache-dir -r /requirements.txt

# Start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
