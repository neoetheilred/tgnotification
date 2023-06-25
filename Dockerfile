FROM alpine:latest

# RUN apt update && apt upgrade
# RUN apt-get -y install curl
# RUN apt-get -y install jq
RUN apk update && apk upgrade
RUN apk add curl
RUN apk add jq
COPY entrypoint.sh ./
RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh", "6219440618:AAH9vXjHntYeYs2-m5Su8y8KKypT95Fo1_M", "5741156547", "testing" ]