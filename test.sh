#!/bin/bash

function waitForProtractor() {
    echo "waitForProtractor"
    retryCount=0
    maxRetry=5
    echo "1st curl"
    curl http://localhost:8080 &>/dev/null
    while [ $? -ne 0 ] && [ "$retryCount" -ne "$maxRetry" ]; do
        echo "Application not reachable yet. Sleep and retry - retryCount =" $retryCount
        sleep 5
        ((retryCount+=1))
        curl http://localhost:8080 &>/dev/null
    done

    if [ $? -ne 0 ]; then
      echo "not connected after" $retryCount " retries. Abort protractor tests."
      exit 0
    fi

    echo "Connected to application"
}

waitForProtractor
