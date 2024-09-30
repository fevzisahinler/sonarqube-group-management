#!/bin/bash

SONAR_URL=""
AUTH_TOKEN=""
GROUP_NAME=""
OUTPUT_FILE=""

SONAR_API="$SONAR_URL/api/user_groups/users"

get_group_users() {
    local group_name=$1
    local page=1
    local page_size=100
    local total_users=1

    > $OUTPUT_FILE

    while [ $total_users -gt 0 ]; do
        response=$(curl -s -u $AUTH_TOKEN: "$SONAR_API?name=$group_name&p=$page&ps=$page_size")

        users=$(echo $response | jq -r '.users[].login')

        if [ -n "$users" ]; then
            echo "$users" >> $OUTPUT_FILE
        else
            break
        fi

        total_users=$(echo $response | jq '.users | length')
        page=$((page + 1))
    done
}

get_group_users "$GROUP_NAME"
