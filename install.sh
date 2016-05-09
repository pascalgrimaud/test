#!/bin/bash

ls -al "$TRAVIS_BUILD_DIR"/
ls -al "$TRAVIS_BUILD_DIR"/generator-jhipster/
cd "$TRAVIS_BUILD_DIR"/generator-jhipster
npm install
npm link
