#!/bin/bash

waitForProtractor() {
    echo "waitForProtractor"
    retryCount=0
    maxRetry=5
    httpUrl="http://localhost:8080"

    rep=$(curl -v "$httpUrl")
    status=$?
    while [ $status -ne 0 ] && [ "$retryCount" -ne "$maxRetry" ]; do
      echo "[$(date)] application not reachable yet. Sleep and retry. retryCount =" $retryCount
      sleep 5
      ((retryCount+=1))

      rep=$(curl -v "$httpUrl")
      status=$?
    done

    if [ $status -ne 0 ]; then
      echo "[$(date)] Not connected after" $retryCount " retries. Abort protractor tests."
      exit 1
    fi

    echo "[$(date)] Connected to application"
}

waitForProtractor
