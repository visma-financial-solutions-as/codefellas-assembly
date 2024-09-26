FROM ubuntu:latest

RUN apt-get update && apt-get install -y gcc gdb nasm vim
VOLUME ["/app"]
WORKDIR /app
