# EASY-STACK: MINI
## A lightweight Docker framework for fast local development: using Docker, Docker Compose, and Makefile.

![Alt text](.makefile/assets/easy-stack-mini.jpg?raw=true" "Easy Stack Mini - DALL-E Image")

## Introduction
This application is a versatile and comprehensive solution that provides a framework for various Docker containers. It can include different types of services, such as backends in Java or PHP, any kind of frontend, or even a complete Docker stack. Modify it to suit your needs. Check out our upcoming Easy-Stacks soon.
With this simple stack, you can build your own Docker images and publish them either locally or through GitHub pipelines. For your own Docker containers, you will need a registry such as Docker Hub or a similar option, like GitHub's container registry.

#### Caution! Caution! This stack is intended for development use only and is not configured for production. Please make sure to change all passwords immediately. You can override the values from the .env.dist file with a custom .env file. For production use, please refer to the "Easy-Stack-Prod" stack - comming soon.

## Installation and Starting the Application
To install and start the application, follow these steps:

### Prerequisites
- Docker and Docker Compose must be installed on the system.

#### Before you run this project, ensure the following are installed on your host system:

- Git
- Docker
- Docker Compose
- Make

#### Build this stack


Clone this Project

```sh
git clone git@github.com:Opillion-GmbH-Co-KG/easy-stack-mini.git

cd ./easy-stack-mini

 ```

To start and install this stack:

```sh
make start
 ```
or

```sh
make restart
```

#### The stack up and running:
## Architecture Overview

##### This stack uses precompiled Docker Hub images. A read-only token has been provided. If you want to build your own images or modify existing ones, you will need a [Docker Hub](https://hub.docker.com/) account or a [GitHub Registry](https://docs.github.com/en/packages/learn-github-packages/introduction-to-github-packages) to store your new images. Please adjust the following environment variables accordingly:

```sh
DOCKER_REPO_USER=<your username>
DOCKER_PASS=<your token>
DOCKER_USER=docker
DOCKER_REPO_NAME=<your repo / username>
```

### Using git pipelines to build Docker images
#### Set up your secrets

![Alt text](.makefile/assets/github-secrets-needed.png?raw=true" "Github secrets")

#### Let Github build your images for you
![Alt text](.makefile/assets/github-build-docker-container.png?raw=true" "Github building Docker container")

#### You don't need this, just use your local dev and not the precompiled Image change:
```sh
DOCKER_IMAGE_SOURCE=dev-compiled

# to

DOCKER_IMAGE_SOURCE=dev
```

### Docker Container
By default, the stack consists of a single Docker container. However, you can easily add additional containers to provide various services and extend the functionality of the stack. The main container and any additional containers you configure are described below:

1. **ALPINE**
    - **Image:** [opillion/alpine](https://hub.docker.com/repository/docker/opillion/alpine)
    - **Description:** Just a simple alpine container
    - **Ports (preconfigured):**
        - **NONE:**
    - **Name:** easy-stack-mini-alpine-1



