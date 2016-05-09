#!/bin/bash

launchDockerPs() {
    retryCount=1
    maxRetry=10

    docker ps -a

    while [ "$retryCount" -lt "$maxRetry" ]; do
        echo "[$(date)] wait... =" $retryCount "/" $maxRetry
        retryCount=$((retryCount+1))
        sleep 30

        docker ps -a
        docker logs app-mysql
    done
}

launchDockerPs
