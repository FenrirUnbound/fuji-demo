#!/bin/sh -x

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
    echo "No access key id. exiting..."
    exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "No secret. exiting..."
    exit 1
fi

packer build -machine-readable config/packer.json | tee build.log

AMI_ID=`grep 'artifact,0,id' build.log | cut -d, -f6 | cut -d: -f2`

if [ -z "$AMI_ID" ]; then
    echo "Error: packer build failed! no AMI_ID"
    exit 2
fi

/opt/sd/meta set ami_id ${AMI_ID}
