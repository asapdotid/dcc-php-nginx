# Container names
## must match the names used in the docker-composer.yml files
DOCKER_SERVICE_APPLICATION_NAME:=application

# FYI:
# Naming convention for images is $(DOCKER_REGISTRY)/$(DOCKER_NAMESPACE)/$(DOCKER_IMAGE):$(DOCKER_IMAGE_TAG)
# e.g.                      docker.io/asapdotid/php-nginx:8.1
# $(DOCKER_REGISTRY)     -----^           ^         ^      ^    docker.io
# $(DOCKER_NAMESPACE)    -----------------^         ^      ^    asapdotid
# $(DOCKER_IMAGE)        ---------------------------^      ^    php-nginx
# $(DOCKER_IMAGE_TAG)    ----------------------------------^    8.1

DOCKER_DIR:=./src
DOCKER_ENV_FILE:=$(DOCKER_DIR)/.env
DOCKER_COMPOSE_FILE:=$(DOCKER_DIR)/compose.yml
DOCKER_COMPOSE_PROXY_FILE:=$(DOCKER_DIR)/compose.proxy.yml
