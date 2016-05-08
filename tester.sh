#!/bin/bash

VOLUME_APP=/home/jhipster/volume/app
VOLUME_GENERATOR=/home/jhipster/volume/generator-jhipster
VOLUME_M2=/home/jhipster/volume/.m2
VOLUME_NODE_MODULES=/home/jhipster/volume/node_modules

################################################################################
# functions
################################################################################
function log {
  echo "[$(date)][TESTER] $*"
}

################################################################################
# detect a .yo-rc.json to start tester
################################################################################
if [ ! -f "$VOLUME_APP"/.yo-rc.json ]; then
  log "no .yo-rc.json file -> stop tester"
  exit 0
fi
cp "$VOLUME_APP"/.yo-rc.json /home/jhipster/app/.yo-rc.json

################################################################################
# change generator-jhipster if needed
################################################################################
npm set progress=false
if [ -f "$VOLUME_GENERATOR"/package.json ]; then
  log "Volume detected for generator-jhipster: /home/jhipster/generator/"
  cp -R "$VOLUME_GENERATOR" /home/jhipster/generator/
  ls -al /home/jhipster/generator/
  cd /home/jhipster/generator/
  log "npm install"
  npm install
  log "npm link"
  npm link
  ls -al /home/jhipster/
  ls -al /usr/lib/node_modules/
  ls -al /home/jhipster/generator/
else
  log "Use default generator-jhipster"
fi

################################################################################
# cache node_modules
################################################################################
if [ -d "$VOLUME_NODE_MODULES" ]; then
  log "Volume detected for node_modules"
  cp -R "$VOLUME_NODE_MODULES" /home/jhipster/app/
else
  log "No cache for node_modules"
  ls -al /home/jhipster/app/
fi

################################################################################
# cache node_modules
################################################################################
if [ -d "$VOLUME_M2" ]; then
  log "Volume detected for m2"
  cp -R "$VOLUME_M2" /home/jhipster/
else
  log "No cache for m2"
  ls -al /home/jhipster/.m2/
fi

################################################################################
# start generate project
################################################################################
log "Start generate project !!!"
cd /home/jhipster/app/
log "link generator-jhipster"
npm link generator-jhipster
log "yo jhipster --force --no-insight"
yo jhipster --force --no-insight

if [ -f mvnw ]; then
  BUILDTOOL="maven"
elif [ -f gradlew ]; then
  BUILDTOOL="gradle"
fi

################################################################################
# back-end tests
################################################################################
log "Start back-end tests"
if [ "$BUILDTOOL" == "maven" ]; then
  ./mvnw test
elif [ "$BUILDTOOL" == "gradle" ]; then
  ./gradlew test
else
  exit 2
fi
status=$?
if [ $status -ne 0 ]; then
  log "Error when launching back-end test"
  exit 2
fi

################################################################################
# front-end tests
################################################################################
log "Start front-end tests"
gulp test --no-notification
status=$?
if [ $status -ne 0 ]; then
  log "Error when launching front-end test"
  exit 3
fi

################################################################################
# packaging
################################################################################
log "Start packaging"
if [ "$BUILDTOOL" == "maven" ]; then
  ./mvnw package -Pprod -DskipTests=true
elif [ "$BUILDTOOL" == "gradle" ]; then
  ./gradlew bootRepackage -Pprod -x test
else
  exit 4
fi
status=$?
if [ $status -ne 0 ]; then
  log "Error when packaging"
  exit 4
fi

################################################################################

log "End of tests"
exit 0
