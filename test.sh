#!/bin/bash
set -ev

PROTRACTOR=1

wlaunchProtractor() {
    retryCount=0
    maxRetry=10
    httpUrl="http://localhost:8080"

    rep=$(curl -v "$httpUrl")
    status=$?
    while [ "$status" -ne 0 ] && [ "$retryCount" -ne "$maxRetry" ]; do
        echo "[$(date)] Application not reachable yet. Sleep and retry - retryCount =" $retryCount "/" $maxRetry
        retryCount=$((retryCount+1))
        sleep 10
        rep=$(curl -v "$httpUrl")
        status=$?
    done

    if [ "$status" -ne 0 ]; then
      echo "[$(date)] Not connected after" $retryCount " retries. Abort protractor tests."
      exit 0
    fi

    echo "[$(date)] Connected to application. Start protractor tests."
    gulp itest --no-notification
}

if [ "$PROTRACTOR" == 1 ]; then
  launchProtractor
fi
