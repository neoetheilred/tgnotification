FROM alpine:latest
RUN apk update && apd upgrade
RUN apk add libc6-compat
RUN apk add curl
COPY notification.sh ./

ENTRYPOINT [ "./notification.sh" ]