#!/bin/bash

waitForProtractor() {
    echo "waitForProtractor"
    retryCount=0
    maxRetry=5
    echo "[$(date)]: Before while"
    httpUrl="http://localhost:8080"
    rep=$(curl -v "$httpUrl")
    status=$?
    echo "$rep"
    echo "$status"
    if [ $status -ne 0 ]; then
      echo "not connected after" $retryCount " retries. Abort protractor tests."
      exit 1
    fi

    echo "Connected to application"
    echo "[$(date)]: End"
}

waitForProtractor
