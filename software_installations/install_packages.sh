#!/bin/bash

# Please replace apt-get with yum if you are using Amazon AMI, which uses RHEL
sudo apt-get update
sudo apt-get install awscli -y
sudo apt-get install pip -y
sudo apt-get install amazon-ec2-utils -y
pip3 install boto3
pip3 install python_dotenv
pip3 install toml
