# EC2 Instance

> How to check EC2 instance metadata using CLI
###### Go to your ec2 terminal than run the below command
```bash
curl -s http://169.254.169.254/latest/dynamic/instance-identity/document/
```

###### Output:
```json
{
    "accountId" : "121679896869",
    "architecture" : "x86_64",
    "availabilityZone" : "ap-southeast-1a",
    "billingProducts" : null,
    "devpayProductCodes" : null,
    "marketplaceProductCodes" : null,
    "imageId" : "ami-0df7a207adb9748c7",
    "instanceId" : "i-0499da4929e8521ea",
    "instanceType" : "t2.micro",
    "kernelId" : null,
    "pendingTime" : "2023-09-24T18:04:23Z",
    "privateIp" : "172.31.47.50",
    "ramdiskId" : null,
    "region" : "ap-southeast-1",
    "version" : "2017-09-30"
}
```
