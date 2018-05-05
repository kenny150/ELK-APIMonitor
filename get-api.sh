#!/bin/bash 


##################################################
#Autor Kennedy Alves                             #
#Versão 1.0                                      #
#Descrição Coleta de dados de qualquer API.      #
##################################################


#Local onde seus dados serão armazenaddos.
FILE="/tmp/gitlab-rails/file-$(date +"%F-%H:%M").log"

#Chamada para a API
curl -XGET http://SEU-GITLAB:8081/api/v4/projects/1/repository/commits?private_token=SEU-TOKEN-PRIVADO \
| jq '.' | tee "$FILE"
