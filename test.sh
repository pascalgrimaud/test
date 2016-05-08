#!/bin/bash

launchDockerPs() {
    retryCount=1
    maxRetry=10

    docker ps -a

    while [ "$retryCount" -gt "$maxRetry" ]; do
        echo "[$(date)] Application not reachable yet. Sleep and retry - retryCount =" $retryCount "/" $maxRetry
        retryCount=$((retryCount+1))
        sleep 30

        docker ps -a
    done
}


launchDockerPs
