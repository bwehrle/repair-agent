
.PHONY: healthcheck
healthcheck: healtcheck-openai-4o

.PHONY: healtcheck-openai-4o
healtcheck-openai-4o:
	@echo "Running $(@)"
	@aider --model openai/gpt-4o \
	--yes-always \
	--env-file ../aider-agent/.env \
	 --load ../aider-agent/scenarios/healthcheck/scenario.cmd

.PHONY: healtcheck-anthropic-haiku
healtcheck-anthropic-sonnet:
	@echo "Running $(@)"
	@aider --model anthropic/claude-3-5-sonnet-20241022 \
	  --yes-always \
	  --env-file ../aider-agent/.env \
	  --load ../aider-agent/scenarios/healthcheck/scenario.cmd

.PHONY: docker-build
docker-build:
	@echo "Building Docker image"
	@docker build -t bwehrle/aider-agent:0.1 --platform linux/arm64/v8,linux/amd64 .

.PHONY: docker-push
docker-push:
	@echo "Pushing Docker image"
	@docker push bwehrle/aider-agent:0.1