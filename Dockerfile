FROM paulgauthier/aider-full
RUN apt-get update
RUN apt-get install -y make
COPY scenarios /app/
COPY Makefile /app/
WORKDIR /app
ENTRYPOINT [ "make" ]
