#!/bin/bash
##########
TOKEN="o.5YJjCvs7q0Q3OpKaFDhpKBcLXCC0ZfeT"
TITLE="$SUBJECT"
MESSAGE="$DESCRIPTION"

##########
MESSAGE=$(echo "$MESSAGE" | sed -e 's:<br[ /]*>:\\n:gI' -e 's/<[^>]*>//g')
curl -s -k -X POST --header "Authorization: Bearer $TOKEN" \
--header  'Content-Type: application/json' \
-d "{\"type\": \"note\", \"title\": \"$TITLE\", \"body\": \"$MESSAGE\"}" \
https://api.pushbullet.com/v2/pushes 2>&1
