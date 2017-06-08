#!/bin/sh

# install jq dependency
apt-get install jq

AMI_ID=`/opt/sd/meta get ami_id`

aws ec2 run-instances --image-id $AMI_ID --count 1 --instance-type t2.micro --key-name fenrirunbound-fuji-app --security-group-ids $SEC_GROUP --subnet-id $SUBNET --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=fuji-app-demo}]' --associate-public-ip-address

PUB_DNS=`aws ec2 describe-instances --filters "Name=image-id,Values=$AMI_ID" | jq ".Reservations[0].Instances[0].PublicDnsName"`

# trim quotes
PUB_DNS="${PUB_DNS%\"}"
PUB_DNS="${PUB_DNS#\"}"

/opt/sd/meta set public_dns $PUB_DNS
