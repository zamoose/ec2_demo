#!/bin/bash

export AWS_ACCESS_KEY_ID=[Your Access Key ID]
export AWS_SECRET_ACCESS_KEY=[Your Secret Key]
export AWS_REGION=[Your preferred AWS region]

Echo "Running Ansible to deploy EC2 instance."
ansible-playbook playbook.yml

ec2_host=`ansible tag_type_webserver -m ping | grep SUCCESS | cut -f1 -d" "`

curl $ec2_host

echo "Please visit ${ec2_host} in your web broswer to see the results."