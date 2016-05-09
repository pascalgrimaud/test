#!/bin/bash

docker run \
  -d --name app-mysql \
  -v "$TRAVIS_BUILD_DIR"/samples/app-mysql:/home/jhipster/volume/app:ro \
  # -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
  # -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
  # -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
  --memory="768m" \
  -t tester

docker run \
  -d --name app-cassandra \
  -v "$TRAVIS_BUILD_DIR"/samples/app-cassandra:/home/jhipster/volume/app:ro \
  # -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
  # -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
  # -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
  --memory="768m" \
  -t tester

docker run \
  -d --name app-mongodb \
  -v "$TRAVIS_BUILD_DIR"/samples/app-mongodb:/home/jhipster/volume/app:ro \
  # -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
  # -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
  # -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
  --memory="768m" \
  -t tester

# docker run \
#   -d --name app-oauth2 \
#   -v "$TRAVIS_BUILD_DIR"/samples/app-oauth2:/home/jhipster/volume/app:ro \
#   -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#   -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
#   -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#   --memory="768m" \
#   -t tester
#
# docker run \
#   -d --name app-psql-es-noi18n \
#   -v "$TRAVIS_BUILD_DIR"/samples/app-psql-es-noi18n:/home/jhipster/volume/app:ro \
#   -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#   -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
#   -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#   --memory="768m" \
#   -t tester
#
#   docker run \
#     -d --name app-gateway \
#     -v "$TRAVIS_BUILD_DIR"/samples/app-gateway:/home/jhipster/volume/app:ro \
#     -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#     -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
#     -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#     --memory="768m" \
#     -t tester
#
#   docker run \
#     -d --name app-gradle \
#     -v "$TRAVIS_BUILD_DIR"/samples/app-gradle:/home/jhipster/volume/app:ro \
#     -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#     -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
#     -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#     --memory="768m" \
#     -t tester
#
#   docker run \
#     -d --name app-hazelcast-cucumber \
#     -v "$TRAVIS_BUILD_DIR"/samples/app-hazelcast-cucumber:/home/jhipster/volume/app:ro \
#     -v /home/pgrimaud/.m2:/home/jhipster/volume/.m2:ro \
#     -v "$TRAVIS_BUILD_DIR"/node_modules:/home/jhipster/volume/node_modules:ro \
#     -v "$TRAVIS_BUILD_DIR"/generator-jhipster:/home/jhipster/volume/generator-jhipster:ro \
#     --memory="768m" \
#     -t tester
