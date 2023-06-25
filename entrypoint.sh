#!/bin/sh -l

body="{\"chat_id\"=\"$2\", \"text\":\"$3\"}"

echo $body
# curl -X POST \
#      -H 'Content-Type: application/json'\
#      -d "{\"chat_id\": \"$2\", \"text\": \"$3\"}" \
#      https://api.telegram.org/bot$1/sendMessage
response=$(curl -X POST \
    -H 'Content-Type: application/json' \
    -d "{\"chat_id\": \"$2\", \"text\":\"$3\"}" \
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