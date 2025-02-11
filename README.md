# EASY STACK MINI
## A lightweight Stack for fast local development: using Docker, Docker Compose, and Makefile.

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

![Alt text](.makefile/assets/console.png?raw=true" "Console view")

## More Information

[Pipeline-Handling README](./README.pipeline.md)


### Docker Container
By default, the stack consists of a single Docker container. However, you can easily add additional containers to provide various services and extend the functionality of the stack. The main container and any additional containers you configure are described below:

1. **ALPINE**
    - **Image:** [opillion/alpine](https://hub.docker.com/repository/docker/opillion/alpine)
    - **Description:** Just a simple alpine container
    - **Ports (preconfigured):**
        - **NONE:**
    - **Name:** easy-stack-mini-alpine-1



