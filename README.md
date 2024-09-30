# SonarQube User Group Management Scripts

This repository contains three Bash scripts designed to manage user groups in SonarQube using the SonarQube REST API. These scripts allow for adding users to a group, retrieving all users from a group, and removing users from a group. Each script interacts with SonarQube's API and expects the user to have appropriate permissions.

## Prerequisites

1. **SonarQube API Token**: You'll need an API token with administrative privileges to manage user groups in SonarQube.
2. **SonarQube URL**: The base URL of your SonarQube instance.
3. **cURL**: These scripts require `cURL` to interact with the SonarQube API.
4. **jq**: A lightweight and flexible command-line JSON processor used to parse API responses.

## Scripts Overview

1. **List Users in a Group (`get_group_users.sh`)**
2. **Add Users to a Group (`add_to_group.sh`)**
3. **Remove Users from a Group (`remove_from_group.sh`)**


### 1. List Users in a Group (`get-group-users.sh`)

This script retrieves all users in a specified SonarQube group and saves them to a file.

#### Script Parameters:
- `SONAR_URL`: The base URL of your SonarQube instance.
- `AUTH_TOKEN`: Your SonarQube API token.
- `GROUP_NAME`: The name of the SonarQube group whose users you want to retrieve.
- `OUTPUT_FILE`: The output file where the list of users will be saved.

#### Example Usage:
```bash
./get-group-users.sh
```

### 2. Add Users to a Group (`add_to_group.sh`)

This script adds a list of users to a specified SonarQube group.

#### Script Parameters:
- `SONAR_URL`: The base URL of your SonarQube instance.
- `AUTH_TOKEN`: Your SonarQube API token.
- `NEW_GROUP`: The group to which users will be added.
- `USER_FILE`: A text file containing the list of user logins (one per line).

#### Example Usage:
```bash
./add_to_group.sh 
```


### 3. Remove Users from a Group (`remove-users-from-group.sh`)

This script removes a list of users from a specified SonarQube group.

#### Script Parameters:
- `SONAR_URL`: The base URL of your SonarQube instance.
- `AUTH_TOKEN`: Your SonarQube API token.
- `GROUP_NAME`: The group from which users will be removed.
- `USER_FILE`: A text file containing the list of user logins (one per line).


#### Example Usage:
```bash
./remove-users-from-group.sh 
```