#! /bin/bash

# For Raspberry PI use only. Please make sure you are running on an raspberry pi
echo "Checking system..."
ARCH=$(uname -m)
if [ '$ARCH' != 'armv7l' ]
then
    echo "Detected Architecture $ARCH is not expected (expecting armv7l). Please make sure you are running this on a Raspberry PI. Script will now exit"
    exit 1
fi

echo "Generating Raspberry PI Images. Make sure you are logged into DockerHub"
echo "Generating Bionic image"
docker build -f .docker/bionic/Dockerfile.arm -t itachi1706/handbrake-multiarch:bionic-rpi-armv7l .
docker push itachi1706/handbrake-multiarch:bionic-rpi-armv7l

echo "Generating Custom Bionic Batch image"
docker build -f .docker/custom/Dockerfile.arm -t itachi1706/handbrake-multiarch:batch-bionic-rpi-armv7l .
docker push itachi1706/handbrake-multiarch:batch-bionic-rpi-armv7l

echo "Raspberry PI Images complete"
