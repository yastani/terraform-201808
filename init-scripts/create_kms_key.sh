#!/bin/bash

# set your aws profile name
read -p "Enter AWS Profile name: " aws_profile_name

# create key and alias
read -p "Enter keyname to use with KMS: " key_name
kms_key_id=`aws kms create-key \
  --description ${key_name} \
  --query "KeyMetadata.KeyId" \
  --output text \
  --profile ${aws_profile_name}`

aws kms create-alias \
  --alias-name alias/${key_name} \
  --target-key-id ${kms_key_id} \
  --profile ${aws_profile_name}

# encrypt
uname=`uname`
read -sp "Enter master password to use with RDS: " password

script_path=`cd $(dirname $0); pwd`

if [ ${uname} = "Darwin" ]; then
  /bin/echo -n ${password} > ${script_path}/plaintext-password
else
  echo -n ${password} > ${script_path}/plaintext-password
fi

payload=`aws kms encrypt \
  --key-id ${kms_key_id} \
  --plaintext fileb://plaintext-password \
  --output text \
  --query CiphertextBlob \
  --profile ${aws_profile_name}`

# generate rds data.tf of terraform

cat <<EOF > ../modules/rds/data.tf
data "aws_kms_secret" "rds" {
  "secret" {
    name    = "${key_name}"
    payload = "${payload}"
  }
}
EOF

exit 0
