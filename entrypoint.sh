#!/bin/sh -l

body="{\"chat_id\"=\"$2\", \"text\":\"$3\"}"

echo $body
response=$(curl -d "$body" https://api.telegram.org/bot$1/sendMessage -H 'Content-Type: application/json')
echo $response
echo "response=$response" >> $GITHUB_OUTPUT
status="$(echo $response | jq -r '.ok')" # extract `ok` field from response, if ok==false, then request is failed
if [ $status = false ] 
then
    echo "error"
    exit 1
fi