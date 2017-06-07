#!/bin/sh

AMI_ID=`/opt/sd/meta get ami_id`

terraform plan -out=terraform_plan -var "ami_id=${AMI_ID}"
