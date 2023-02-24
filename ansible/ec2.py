#!/usr/bin/env python3

import os
import sys

import boto.ec2

# get credentials from environment variables
AWS_ACCESS_KEY_ID = os.environ.get('AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')

# connect to EC2
conn = boto.ec2.connect_to_region('us-west-2', aws_access_key_id=AWS_ACCESS_KEY_ID,
                                  aws_secret_access_key=AWS_SECRET_ACCESS_KEY)

# get all instances with a specific tag
reservations = conn.get_all_instances(filters={'tag-key': 'Name', 'tag-value': 'Instancias IaC'})
instances = [i for r in reservations for i in r.instances]

# print inventory in Ansible format
print('[my_group]')
for i in instances:
    print(i.ip_address)
