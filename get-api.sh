#!/bin/bash 

FILE="/tmp/gitlab-rails/file-$(date +"%F-%H:%M").log"

curl -XGET http://SEU-GITLAB:8081/api/v4/projects/1/repository/commits?private_token=SEU-TOKEN-PRIVADO \
| jq '.' | tee "$FILE"
