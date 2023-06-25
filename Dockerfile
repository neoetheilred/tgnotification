FROM debian:11-slim

RUN apt update && apt upgrade
RUN apt-get -y install curl
COPY entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]