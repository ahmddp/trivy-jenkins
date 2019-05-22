#!/bin/bash

# Get image name as parameter
IMAGE=$1
echo "The image to be scanned is: "$IMAGE

# scan the image
trivy $IMAGE

# Get the exit code
EXITCODE=0

exit $EXITCODE