FROM ubuntu:20.04

ENV DIRECTORY="/app"

COPY compressor.sh /

RUN mkdir -p ${DIRECTORY} && \
    adduser --system --group minify && \
    chown -R minify:minify ${DIRECTORY} && \
    chmod +x compressor.sh

RUN apt update && \
    apt install minify

WORKDIR /app

ENTRYPOINT /compressor.sh