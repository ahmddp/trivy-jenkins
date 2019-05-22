#!/bin/bash

# Get image name as parameter
IMAGE=$1
echo "The image to be scanned is: "$IMAGE

# scan the image
trivy --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 $IMAGE

# Get the exit code
EXITCODE=$?

exit $EXITCODE