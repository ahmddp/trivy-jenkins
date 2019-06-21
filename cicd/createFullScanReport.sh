#!/bin/bash

# Scans the given docker image with trivy
# and creates a full scan report for all types of severity levels

############### ATTENTION #########################
# The script scans only the local images
# That's why trivy doesn't need env vars to be set
###################################################

# $1 - image

if [ "$#" -ne 1 ]; then
    echo "Incorrect number of parameters passed in."
    echo "Usage: $0 image_to_be_scanned"
    exit 1
fi

# Save image name into a local variable
IMAGE=$1
echo "The full-scan report will be generated for image: "$IMAGE

# Set the name of scan report file
FILENAME="FullScanReport.txt"

# scan the image and save the output into a file
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/Library/Caches:/root/.cache/ \
    haubusacr.azurecr.io/security/trivy:c29f6f5 --exit-code 1 --severity UNKNOWN,LOW,MEDIUM,HIGH --quiet --skip-update $IMAGE > $FILENAME

# Get the exit code
EXITCODE=$?

# Return the exit code
exit $EXITCODE
