#!/bin/zsh
# Run agent locally using local .env file in working dir
docker run -v $(pwd):/repo aider-agent  $1