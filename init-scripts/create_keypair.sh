#!/bin/bash

# set your aws profile name
read -p "Enter AWS Profile name: " aws_profile_name

keypair_name=first-issue-key
aws ec2 create-key-pair \
  --key-name ${keypair_name} \
  --query "KeyMaterial" \
  --output text > ~/.ssh/${keypair_name} \
  --profile ${aws_profile_name}

chmod 600 ~/.ssh/${keypair_name}
ls -la ~/.ssh | grep ${keypair_name}

exit 0
