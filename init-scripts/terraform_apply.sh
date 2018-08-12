#!/bin/bash

read -p "Enter the workspace name to be used this time: " workspace_name
root_dir=`cd $(dirname $0); pwd`

# apply
for resource in vpc route53 ec2 rds
do
  cd ../environments/${resource}
  terraform init -backend-config="profile=terraform"
  terraform workspace new ${workspace_name}
  terraform workspace select ${workspace_name}
  terraform apply --auto-approve

  pid=$!
  wait $pid
  cd ${root_dir}
done
