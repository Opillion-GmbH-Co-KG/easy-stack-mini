## Pipeline Overview

##### This stack uses precompiled Docker Hub images. A read-only token has been provided. If you want to build your own images or modify existing ones, you will need a [Docker Hub](https://hub.docker.com/) account or a [GitHub Registry](https://docs.github.com/en/packages/learn-github-packages/introduction-to-github-packages) to store your new images. Please adjust the following environment variables accordingly:

```sh
DOCKER_REPO_USER=<your username>
DOCKER_PASS=<your token>
DOCKER_USER=docker
DOCKER_REPO_NAME=<your repository/username>
```

### Using Git pipelines to build Docker images
#### Set up your secrets

![Alt text](.makefile/assets/github-secrets-needed.png?raw=true "GitHub secrets")

#### Select a branch you want to build your images from
![Alt text](.makefile/assets/easy-build.png?raw=true "GitHub easy build Docker container")

#### Advanced build
![Alt text](.makefile/assets/github-build-docker-container.png?raw=true "GitHub advanced build Docker container")

#### You don't need this. Just use your local development environment instead of the precompiled image by changing:
```sh
DOCKER_IMAGE_SOURCE=dev-compiled

# to

DOCKER_IMAGE_SOURCE=dev
```
