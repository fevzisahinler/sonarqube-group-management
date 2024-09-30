#!/bin/bash

SONAR_URL=""
AUTH_TOKEN=""
GROUP_NAME=""
USER_FILE=""

remove_from_group() {
    local group_name=$1
    local user=$2

    response=$(curl -s -u $AUTH_TOKEN: -X POST "$SONAR_URL/api/user_groups/remove_user?name=$group_name&login=$user")

    if [ -z "$response" ]; then
        echo “$user was successfully removed from group $group_name.”
    else
        echo “$user could not be removed from group response: $response”
    fi
}

while read -r user; do
    remove_from_group "$GROUP_NAME" "$user"
done < "$USER_FILE"