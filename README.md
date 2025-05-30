# DevOPS & MlOPS
> AWS Solutions Associate Architect Associate.

######  Table of contents
- EC2
- VPC
- Subnet
- S3
- EBS (Amazon Elastic Block Store)
- RDS
- Route53
- Lambda
- LB (load balancer)
- API Gateway
- CI/CD
- CloudFront
- Auto Scaling

#### To download your AWS RDS PostgreSQL database from the AWS Console, follow these steps:

###### Step 1: Take a Snapshot
- Go to the AWS RDS Console.
- Click on your database instance
- Navigate to the Maintenance & backups tab
- Scroll down to Snapshots.
- Click "Take snapshot."
- Give it a name (e.g., dbname-backup)
- Click "Create snapshot".
- Wait for the snapshot to appear in the Snapshots list (it may take a few minutes).

  ###### Step 2: Export the Snapshot to an S3 Bucket
- Go to Snapshots under the RDS menu
- Select the snapshot you just created
- Click "Actions" → "Export to Amazon S3"
- Choose or create an S3 bucket to store the backup
- Select "PostgreSQL" as the format.
- Click "Start Export"
- Wait for AWS to complete the export

 ###### Step 2: Export the Snapshot to an S3 Bucket
 - Go to AWS S3 Console
 - Open the bucket where the backup was exported
 - Locate the backup file (.csv or .parquet for individual tables, or .sql for a full dump).
 - Click "Download"
