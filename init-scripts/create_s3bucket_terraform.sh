#!/bin/bash

# set your aws profile name
read -p "Enter AWS Profile name: " aws_profile_name

# create s3 bucket
default_region="ap-northeast-1"

read -p "Enter s3 bucket name to use with Terraform: " bucket_name
aws s3api create-bucket \
  --bucket ${bucket_name} \
  --acl private \
  --create-bucket-configuration LocationConstraint=${default_region} \
  --profile ${aws_profile_name}

aws s3api put-bucket-versioning \
  --bucket ${bucket_name} \
  --versioning-configuration Status=Enabled \
  --profile ${aws_profile_name}

exit 0
