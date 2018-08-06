#!/bin/bash

uname=`uname`
password="Input Your password"

if [ ${uname} = "Darwin" ]; then
  /bin/echo -n ${password} > plaintext-password
else
  echo -n ${password} > plaintext-password
fi

aws kms encrypt \
  --key-id f3078b45-c614-4e93-88e9-af4d54b34d34 \
  --plaintext fileb://plaintext-password \
  --output text \
  --query CiphertextBlob