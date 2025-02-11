|--------------------------------|-----------------------------------------------------------------------------|
| Make Commands                  | Description                                                                 |
|--------------------------------|-----------------------------------------------------------------------------|
| `make build`                   | Builds the current stack                                                    |
| `make build-%`                 | Builds and pushes (base/dev/prod) images to Docker Hub with Buildx          |
| `make clean-stack`             | Stops, removes and deletes volumes, images, and networks                    |
| `make console`                 | Runs a bash for alpine                                                      |
| `make docker-login`            | Logs in to Docker Hub registry                                              |
| `make fix-buildx`              | Fixes a broken Buildx setup                                                 |
| `make fix-line-endings`        | Fixes the line endings of all files                                         |
| `make help`                    | Shows help for make commands                                                |
| `make remove-buildx`           | Removes Buildx runtime container                                            |
| `make restart`                 | Cleans your stack containers, volumes, networks & restarts all services     |
| `make start`                   | Starts all services defined in your docker-compose file                     |
| `make stop`                    | Stops running Docker containers                                             |
| `make validate-docker-compose` | Validates the docker-compose.yml file                                       |
|--------------------------------|-----------------------------------------------------------------------------|

|---------------------------------|----------------------------------------------------------------------------|
| Additional Commands Swarm       | Description                                                                |
|---------------------------------|----------------------------------------------------------------------------|
| `make create-secrets`           | Creates docker secrets from .env.dist                                      |
| `make kill-docker-proxy`        | Kills all running Docker proxy instances                                   |
| `make list-nodes`               | Lists all Docker Swarm nodes                                               |
| `make list-stacks`              | Lists all running Docker Swarm stacks                                      |
| `make swarm`                    | Initializes a Docker Swarm setup                                           |
| `make swarm-clean-secrets`      | Removes all Docker Swarm secrets                                           |
| `make swarm-init`               | Initializes Docker Swarm                                                   |
| `make swarm-join`               | Joins an existing Docker Swarm                                             |
| `make swarm-ps`                 | Shows running processes in a Docker Swarm stack                            |
| `make swarm-running`            | Lists running services in a Docker Swarm stack                             |
| `make swarm-secrets`            | Displays Docker Swarm secrets                                              |
| `make swarm-services`           | Lists all services in Docker Swarm                                         |
| `make swarm-show`               | Shows details of the Docker Swarm configuration                            |
| `make swarm-stop`               | Stops and removes the Docker Swarm stack                                   |
| `make docker-pull-images`       | Pulls all required Docker images                                           |
|----------------------------------|---------------------------------------------------------------------------|
