FROM debian:11-slim

RUN apt update && apt upgrade
RUN apt-get -y install curl
COPY notification.sh ./
RUN chmod +x ./notification.sh

ENTRYPOINT [ "/notification.sh" ]