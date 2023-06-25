FROM alpine:latest

RUN apk add libc6-compat
RUN apk add curl
COPY notification.sh ./
RUN chmod +x ./notification.sh

ENTRYPOINT [ "./notification.sh" ]