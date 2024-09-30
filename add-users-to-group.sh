#!/bin/bash

SONAR_URL=""
AUTH_TOKEN=""
NEW_GROUP=""
USER_FILE=""

add_to_group() {
    local group_name=$1
    local user=$2

    response=$(curl -s -u $AUTH_TOKEN: -X POST "$SONAR_URL/api/user_groups/add_user?name=$group_name&login=$user")

    if [ -z "$response" ]; then
        echo “$user was successfully added to group $group_name.”
    else
        echo “$user could not be added: $response”
    fi
}

while read -r user; do
    add_to_group "$NEW_GROUP" "$user"
done < "$USER_FILE"
