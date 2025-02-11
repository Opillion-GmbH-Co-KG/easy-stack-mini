## Pipeline Overview

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