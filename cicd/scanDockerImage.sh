#!/bin/bash

# Get image name as parameter
IMAGE=$1
echo "The image to be scanned is: "$IMAGE

# scan the image
trivy --exit-code 1 --severity CRITICAL --quiet --auto-refresh $IMAGE

# Get the exit code
EXITCODE=$?

exit $EXITCODE