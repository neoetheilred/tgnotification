#!/bin/sh -l

echo "{\"chat_id\"=\"$2\", \"text\":\"$3\"}\n"
response=$(curl -w "\n" -d "{\"chat_id\"=\"$2\", \"text\":\"$3\"}" \
    https://api.telegram.org/bot$1/sendMessage \
    -H 'Content-Type: application/json')
echo $response
echo "response=$response" >> $GITHUB_OUTPUT