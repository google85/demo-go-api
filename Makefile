.PHONY: help
help: # View all make targets
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build
		@echo Building image
		docker build -t api-go-demo .

.PHONY: dev
dev: ## Exec in container
		@echo Entering container
		@echo "Please make start" && exit 1
		make build && \
		docker run --rm --tty --interactive  -w /app  api-go-demo:latest  /bin/bash

.PHONY: start
start: ## Start all containers
		@echo Starting all
		docker run --rm --name api-go-demo-container -p 8080:8080  api-go-demo:latest
#		docker compose up -d

.PHONY: stop
stop: ## Stop all containers
		@echo Stopping all
#		docker compose down