#!/bin/bash 

FILE="/tmp/gitlab-rails/file-$(date +"%F-%H:%M").log"
#curl -i --header "PRIVATE-TOKEN: odUrqqiAapVazLQyFG9u" "http://localhost:8081/api/v4/projects" -H "Accept:application/json" -o "$FILE"
curl -XGET http://SEU-GITLAB:8081/api/v4/projects/1/repository/commits?private_token=SEU-TOKEN-PRIVADO \
| jq '.' | tee "$FILE"
