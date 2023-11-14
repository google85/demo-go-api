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
		make build && \
		docker run --rm --tty --interactive  -w /app  api-go-demo:latest  /bin/bash

.PHONY: start
start: ## Start all containers
		@echo Starting all
		make build && \
		make dev
#		docker run -rm -it  -w /app api-go-demo:latest  /bin/bash
#		echo docker run -p demo-api-go  api-go-demo:latest
#		docker compose up -d

.PHONY: stop
stop: ## Stop all containers
		@echo Stopping all
#		docker compose down