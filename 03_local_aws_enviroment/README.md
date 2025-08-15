# Local AWS Environment with LocalStack

This example demonstrates how to set up a local AWS development environment using LocalStack and Terraform for testing AWS services without incurring cloud costs.

## 🎯 What This Example Does

- Deploys LocalStack container with S3 and SQS services
- Configures Terraform AWS provider to use local endpoints
- Sets up persistent storage for LocalStack data
- Provides a complete local AWS testing environment

## 📋 Prerequisites

- Terraform v1.12.2+
- Docker v28.3.3+
- AWS CLI v2.22.28+ (for testing)

## 🚀 Deployment

1. **Initialize and apply Terraform configuration**:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

2. **Verify LocalStack container is running**:
   ```bash
   docker ps | grep localstack
   ```

## 🧪 Testing the Environment

### Configure AWS CLI for LocalStack

Set up AWS CLI with dummy credentials for local testing:

```bash
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-west-2
```

### SQS Service Testing

**Create an SQS queue**:
```bash
aws sqs create-queue --queue-name my-test-queue --endpoint-url http://localhost:4566
```

**List all queues**:
```bash
aws sqs list-queues --endpoint-url http://localhost:4566
```

### S3 Service Testing

**Create an S3 bucket**:
```bash
aws s3 mb s3://my-test-bucket --endpoint-url http://localhost:4566
```

**List all buckets**:
```bash
aws s3 ls --endpoint-url http://localhost:4566
```

### STS Service Testing

**Get caller identity** (verify STS functionality):
```bash
aws sts get-caller-identity --endpoint-url http://localhost:4566
```

## ⚡ Alternative: Using awscli-local

For easier testing without specifying `--endpoint-url` each time, you can use the `awscli-local` wrapper:

### Installation
```bash
pip install awscli-local
```

### Usage
Replace `aws` with `awslocal` in your commands:

```bash
# SQS commands
awslocal sqs create-queue --queue-name my-test-queue
awslocal sqs list-queues

# S3 commands
awslocal s3 mb s3://my-test-bucket
awslocal s3 ls

# STS command
awslocal sts get-caller-identity
```

## 🔍 Verification Checklist

After running the Terraform configuration, verify:

- [ ] LocalStack container is running on port 4566
- [ ] SQS service responds to queue operations
- [ ] S3 service responds to bucket operations
- [ ] STS service returns caller identity
- [ ] Data persists across container restarts

## 🛠️ Troubleshooting

**Container not starting**: Check Docker logs
```bash
docker logs <localstack-container-name>
```

**Service not responding**: Verify LocalStack health
```bash
curl http://localhost:4566/health
```

**Port conflicts**: Ensure port 4566 is available
```bash
netstat -tlnp | grep :4566
```

## 🧹 Cleanup

Remove all resources:
```bash
terraform destroy
```

---

**Note**: This setup uses LocalStack's free tier with S3 and SQS services. All data is stored locally and no actual AWS charges will be incurred.