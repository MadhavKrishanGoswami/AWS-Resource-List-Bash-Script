# AWS Resource List Script  

This script lists all the resources in an AWS account for specified services and regions. It simplifies resource tracking and management across multiple AWS services.  

## Author  
Madhav Krishan Goswami  

## Version  
v0.0.1  

## Supported AWS Services  
The following AWS services are supported by this script:  
1. EC2  
2. S3  
3. RDS  
4. DynamoDB  
5. Lambda  
6. EBS  
7. VPC  
8. CloudFront  
9. CloudWatch  
10. CloudFormation  
11. CloudTrail  
12. IAM  
13. Route53  
14. SNS  
15. SQS  

## Usage  
Run the script with the following syntax:  
```bash
./aws_resource_list.sh <region> <service_name>
```  
- `<region>`: The AWS region to query resources from (e.g., `us-east-1`).  
- `<service_name>`: The AWS service to list resources for (e.g., `ec2`, `s3`, etc.).  

### Example  
To list EC2 instances in the `us-east-1` region:  
```bash
./aws_resource_list.sh us-east-1 ec2
```  

## Notes  
- Ensure your AWS CLI user has sufficient permissions to query the resources for the specified services.  
- If no resources are found, the script will notify you.  

## License  
This script is licensed under the MIT License.  

---  
For any issues or contributions, feel free to open an issue or submit a pull request.
