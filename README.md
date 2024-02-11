# tensorflow-lab

This project provides a pre-configured TensorFlow environment within a Docker container, making it easy to start experimenting with TensorFlow.

## Requirements

* Docker
* Docker Compose (optional, but recommended)
* Nvidia GPU drivers (optional, but recommended)

## Getting Started

### 1. Using the Pre-Built Image

Pull the latest jcorpac/tensorflow-lab image from Docker Hub:

```docker pull jcorpac/tensorflow-lab:latest```

### 2. Building the Image

If you'd like to customize the image, follow these steps:

1. Clone this repository:

    ``` git clone https://github.com/jcorpac/tensorflow-lab.git ```

2. Navigate into the cloned directory:

    ```cd tensorflow-lab```

3. Build the Docker image:

    ```docker build -t tensorflow-lab .```

## Running the Container

### Using Docker Compose (Recommended)

``` docker compose up -d ```

* The docker-compose file included with this repository will set up all of the resources included in the docker run command below.
* The -d flag will run the container in the background.

### Using Docker

``` docker run -d --rm --gpus all -p 8888:8888 -v tensorflow:/tf/notebooks -v jupyter-config:/root/.jupyter --name tensorflow-lab jcorpac/tensorflow-lab:latest ```

* This will map port 8888 (or whichever port your Jupyter environment is configured for) on your host machine to the container.
* The -d flag will run the container in the background.
* The --rm flag will remove the container when it is stopped.
* The --gpus all tag will allow for passthrough of the Nvidia GPU drivers on your machine.
* The first -v tag will attach, a volume called "tensorflow" to your container in the /tf/notebooks directory. This volume will be used to store your Jupyter notebooks between instances of the container. If no container named "tensorflow" exists, it will be created.
* The second -v tag will attach, a volume called "jupyter-config" to your container to store Jupyter configuration files. This volume will be used to store your Jupyter configuration between instances of the container. If no container named "jupyter-config" exists, it will be created.
* The --name tag will set the name of the container to "tensorflow-lab". This is optional, but recommended.
* jcorpac/tensorflow-lab:latest is the name of the Docker image to use. This will be the latest version of the image stored on my Docker Hub account. If you built a custom image, feel free to use that here instead.

## Accessing Tensorflow Lab

Once the container is running, open your web browser and go to:

``` http://localhost:8888 ```

You should now have access to your Jupyter Lab environment, fully equipped with TensorFlow!

## Cleanup

Using either command will stop and remove the container. Any volumes attached to the container will remain to be used in the future.

### Using Docker Compose (Recommended)

 ``` docker-compose down ```

### Using Docker

 ``` docker stop tensorflow-lab ```

## Author

[Jeff Corpac](https://github.com/jcorpac)
