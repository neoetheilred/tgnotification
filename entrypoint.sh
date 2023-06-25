#!/bin/sh -l

body="{\"chat_id\": \"$2\", \"text\":\"$3\", \"parse_mode\": \"MarkdownV2\"}"

echo $body
response=$(curl -X POST \
    -H 'Content-Type: application/json' \
    -d $body \
    https://api.telegram.org/bot$1/sendMessage)
# response=$(curl https://api.telegram.org/bot$1/getMe)
echo $response
echo "response=$response" >> $GITHUB_OUTPUT
status="$(echo $response | jq -r '.ok')" # extract `ok` field from response, if ok==false, then request is failed
if [ $status = false ] 
then
    echo "error"
    exit 1
fi
