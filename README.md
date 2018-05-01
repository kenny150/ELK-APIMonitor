DESCRIÇÃO

Aqui tem todos os passsos para a criação de um ambiente dockerizado com integração entre Logstash, Elasticsearch e Kibana com monitoramento dos dados da API do Gitlab.

PASSO 1 

Subir um container com o Elasticsearch 

sudo docker run -dti --restart=always --name elasticsearch -h elasticsearch -p 9200:9200 -p 9300:9300 elasticsearch

Faça o teste via curl : curl http://SEU_ELASTICSEARCH_HOST:9200

PASSO 2 

Subir um container com o Kibana

sudo docker run --restart=always -d -p 5601:5601 -h kibana --name kibana --link elasticsearch:elasticsearch kibana

O Conteiner do Kibana está linkado com o do Elasticsearch para que haja conexão.

PASSO 3

Crie um arquivo chamado logstash.conf (Há um template disponível nesta página)

No meu caso, deixei o arquivo dentro de /tmp/ na minha máquina local.

PASSO 4 

Criar o container do gitlab.

sudo docker container run -d -p 8081:80 --name gitlab --restart=always --link elasticsearch:elasticsearch -v /tmp/:/etc/gitlab -v /tmp/:/var/log/gitlab gitlab/gitlab-ce

OBS: Não estou fazendo dados persistentes do Gitlab, para fazer basta criar um novo volume apontando para as configurações do Gitlab (Veja na pagina do Gitlab qual diretório é necessário montar).

PASSO 5 

Crie o container do logstash .

docker run -ti --rm --name logstash --link elasticsearch:elasticsearch -v /tmp/:/config-dir logstash -f /config-dir/logstash.conf --config.reload.automatic

ACESSANDO 

http://localhost:9200
http://localhost:5601
http://localhost:8081

CONFIGURAÇÃO DO CRON

*/1 * * * * /bin/bash /LOCAL/DO/SCRIPT/get-api.sh


