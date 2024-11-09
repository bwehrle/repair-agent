FROM bwehrle/aider
RUN apt remove --purge --auto-remove -y git
RUN apt-get update
RUN apt-get install -y python3-launchpadlib
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:git-core/ppa
RUN apt update
RUN apt install -y git-core
COPY scenarios /aider-agent/scenarios/
COPY Makefile /aider-agent/.
WORKDIR /repo
RUN git config --global --add safe.directory /repo
ENTRYPOINT [ "make", "-f", "/aider-agent/Makefile" ]
