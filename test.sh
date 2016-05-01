#!/bin/bash

waitForProtractor() {
    echo "waitForProtractor"
    retryCount=0
    maxRetry=5
    while [ "$retryCount" -ne "$maxRetry" ]; do
        curl http://localhost:8080 &>/dev/null && break
        echo "Application not reachable yet. Sleep and retry - retryCount =" $retryCount
        sleep 5
        ((retryCount+=1))
    done

    if [ "$retryCount" -eq "$maxRetry" ]; then
      echo "not connected after" $retryCount " retries. Abort protractor tests."
      exit 0
    fi

    echo "Connected to application"
}

waitForProtractor
