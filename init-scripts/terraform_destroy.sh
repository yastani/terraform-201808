#!/bin/bash

read -p "Enter the workspace name to be used this time: " workspace_name
root_dir=`cd $(dirname $0); pwd`

# destroy
for resource in rds ec2 route53 vpc
do
  cd ../environments/${resource}
  terraform workspace select ${workspace_name}
  terraform destroy --auto-approve
  terraform workspace select default
  terraform workspace delete ${workspace_name}

  pid=$!
  wait $pid
  cd ${root_dir}
done
