#!/bin/bash

waitForProtractor() {
    echo "waitForProtractor"
    retryCount=0
    maxRetry=5
    echo "Before while"
    curl --retry 5 --retry-delay 5 http://localhost:8080 &>/dev/null
    if [ $? -ne 0 ]; then
      echo "not connected after" $retryCount " retries. Abort protractor tests."
      exit 1
    fi
    echo "Connected to application"
}

waitForProtractor
