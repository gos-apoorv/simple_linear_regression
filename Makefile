SHELL=/bin/bash
app := simple-linear-regression

default: help ## Display this help screen

shell: ## Start Pipenv Shell
	pipenv shell

docker_build: ## Build Docker Image
	docker build --platform linux/amd64 -t my-jupyter .

docker_run: ## Run Docker Image
	docker run -p 8888:8888 my-jupyter

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'