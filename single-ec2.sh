#!/bin/bash

#NAMES=$@

NAMES="web"
INSTANCE_TYPE="t2.micro"
IMAGE_ID=ami-0b4f379183e5706b9
SECURITY_GROUP_ID=sg-030283547d62a478c
DOMAIN_NAME=ammanni.shop
HOSTED_ZONE_ID=Z01660352B79IYCPM0R9

# if mysql or mongodb instance_type should be t3.medium , for all others it is t2.micro
echo "creating $NAMES instance"
IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID  --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
echo "created $NAMES instance: $IP_ADDRESS"
