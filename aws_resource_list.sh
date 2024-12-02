#!/bin/bash

#############################################################
# This script will list all the resources in the AWS account
# Author: Madhav Krishan Goswami
# Version:  v0.0.1
# Following are the supported AWS services by this script:
# 1. EC2
# 2. S3
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. EBS
# 7. VPC
# 8. CloudFront
# 9. CloudWatch
# 10. CloudFormation
# 11. CloudTrail
# 12. IAM
# 13. Route53
# 14. SNS
# 15. SQS

# Usage: ./aws_resource_list.sh <region> <service_name>
#############################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
  echo "Usage: $0 <region> <service_name>"
  exit 1
fi

# Check if the AWS CLI is installed
if ! command -v aws &>/dev/null; then
  #Install aws cli if not installed already for mac and linux
  echo "AWS CLI is not installed. Installing AWS CLI..."
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    #if this works then we are on ubuntu or debian based system
    sudo apt-get update
    sudo apt-get install awscli -y
    # Check if the installation was successful
    if ! command -v aws &>/dev/null; then
      echo "AWS CLI installation failed. Please install AWS CLI manually."
      exit 1
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # if brew is installed we use install using brew
    brew install awscli
    # Check if the installation was successful
    if ! command -v aws &>/dev/null; then
      echo "AWS CLI installation failed. Please install AWS CLI manually."
      exit 1
    fi
  else
    echo "Unsupported OS. Please install AWS CLI manually."
    exit 1
  fi

fi

# Check if the AWS CLI is configured
if ! aws configure get aws_access_key_id &>/dev/null; then
  # Configure the AWS CLI if not configured already automatically
  echo "AWS CLI is not configured yet. Please configure the AWS CLI."
  aws configure
  # Check if the configuration was successful
  if ! aws configure get aws_access_key_id &>/dev/null; then
    echo "AWS CLI configuration failed. Please configure the AWS CLI manually."
    exit 1
  fi
fi

# Get the region and service name from the command line arguments
region=$1
service=$2

# Execute the appropriate AWS CLI command based on the service name
case $service in
"EC2")
  aws ec2 describe-instances --region $region
  ;;
"S3")
  aws s3api list-buckets --region $region
  ;;
"RDS")
  aws rds describe-db-instances --region $region
  ;;
"DynamoDB")
  aws dynamodb list-tables --region $region
  ;;
"Lambda")
  aws lambda list-functions --region $region
  ;;
"EBS")
  aws ec2 describe-volumes --region $region
  ;;
"VPC")
  aws ec2 describe-vpcs --region $region
  ;;
"CloudFront")
  aws cloudfront list-distributions --region $region
  ;;
"CloudWatch")
  aws cloudwatch list-metrics --region $region
  ;;
"CloudFormation")
  aws cloudformation list-stacks --region $region
  ;;
"CloudTrail")
  aws cloudtrail describe-trails --region $region
  ;;
"IAM")
  aws iam list-users --region $region
  ;;
"Route53")
  aws route53 list-hosted-zones --region $region
  ;;
"SNS")
  aws sns list-topics --region $region
  ;;
"SQS")
  aws sqs list-queues --region $region
  ;;
*)
  echo "Unsupported service name. Please provide a valid service name."
  exit 1
  ;;
esac

# End of script
