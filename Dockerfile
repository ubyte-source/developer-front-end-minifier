FROM ubuntu:20.04

ENV DIRECTORY="/app"

COPY compressor.sh /

RUN apt update && \
    apt install minify

RUN mkdir -p ${DIRECTORY} && \
    adduser --system --group minify && \
    chown -R minify:minify ${DIRECTORY} && \
    chmod +x compressor.sh

WORKDIR /app

ENTRYPOINT /compressor.sh