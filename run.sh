#!/bin/bash

docker run \
  -d --name app-mysql \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-mysql:/home/jhipster/volume/app:ro \
  -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
  --memory="768m" \
  -t tester

docker run \
  -d --name app-cassandra \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-cassandra:/home/jhipster/volume/app:ro \
  -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
  --memory="768m" \
  -t tester

docker run \
  -d --name app-mongodb \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-mongodb:/home/jhipster/volume/app:ro \
  -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
  -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
  --memory="768m" \
  -t tester

# docker run \
#   -d --name app-oauth2 \
#   -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-oauth2:/home/jhipster/volume/app:ro \
#   -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#   -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
#   -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#   --memory="768m" \
#   -t tester
#
# docker run \
#   -d --name app-psql-es-noi18n \
#   -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-psql-es-noi18n:/home/jhipster/volume/app:ro \
#   -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#   -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
#   -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#   --memory="768m" \
#   -t tester
#
#   docker run \
#     -d --name app-gateway \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-gateway:/home/jhipster/volume/app:ro \
#     -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#     --memory="768m" \
#     -t tester
#
#   docker run \
#     -d --name app-gradle \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-gradle:/home/jhipster/volume/app:ro \
#     -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#     --memory="768m" \
#     -t tester
#
#   docker run \
#     -d --name app-hazelcast-cucumber \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/samples/app-hazelcast-cucumber:/home/jhipster/volume/app:ro \
#     -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/node_modules:/home/jhipster/volume/node_modules:ro \
#     -v /home/pgrimaud/workspace/pascalgrimaud/jhipster-tester/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#     --memory="768m" \
#     -t tester
