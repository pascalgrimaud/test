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
    while [ $status -ne 0 ] && [ "$retryCount" -ne "$maxRetry" ]; do
      log "application not reachable yet. Sleep and retry. retryCount =" $retryCount
      sleep 5
      ((retryCount+=1))

      httpUrl="http://localhost:8080"
      rep=$(curl -v "$httpUrl")
      status=$?
      echo "$rep"
      echo "$status"
    done

    if [ $status -ne 0 ]; then
      echo "not connected after" $retryCount " retries. Abort protractor tests."
      exit 1
    fi

    echo "Connected to application"
    echo "[$(date)]: End"
}

waitForProtractor
