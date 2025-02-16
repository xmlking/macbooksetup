# AWS

## Install

```shell
brew install awscli
aws configure
```

```shell
export AWS_ACCESS_KEY_ID=FIXME
export AWS_SECRET_ACCESS_KEY=FIXME
export AWS_DEFAULT_REGION=us-east-1
```

What you will be asked in the command prompt:

```shell
aws configure --profile hyniva
AWS Access Key ID [None]: FIXME
AWS Secret Access Key [None]: FIXME
Default region name [None]: us-east-1
Default output format [None]: json
```

## Usage

```shell
aws configure region (region-name)
# List API Gateway keys
aws apigateway get-rest-apis | jq -r ‘.items[ ] | .id+” “+.name’
# List API Gateway domain names
aws apigateway get-domain-names | jq -r ‘.items[ ] | .domainName+” “+.regionalDomainName’
# List resources for API Gateway
aws apigateway get-resources --rest-api-id ee86b4cde | jq -r ‘.items[ ] | .id+” “+.path’
aws ec2 describe-instances | jq -r '.Reservations[].Instances[]|.InstanceId+" "+.InstanceType+" "+(.Tags[] | select(.Key == "Name").Value)'
# Create a cluster
aws eks create-cluster --name (cluster name)
# Delete a cluster
aws eks delete-cluster --name (cluster name)
# List descriptive information about a cluster
aws eks describe-cluster --name (cluster name)
# List clusters in your default region
aws eks list-clusters
# Tag a resource
aws eks tag-resource --resource-arn (resource_ARN) --tags (tags)
# List DB clusters
aws rds describe-db-clusters | jq -r ‘.DBClusters[ ] | .DBClusterIdentifier+” “+.Endpoint’
# List DB instances
aws rds describe-db-instances | jq -r ‘.DBInstances[ ] | .DBInstanceIdentifier+” “+.DBInstanceClass+” “+.Endpoint.Address’
aws s3 ls
```

### eksctl

```shell
brew tap weaveworks/tap
brew install weaveworks/tap/eksctl
```

## Reference

- [AWS CLI Cheatsheet](https://www.bluematador.com/learn/aws-cli-cheatsheet)
- Set up to use [Amazon EKS](https://docs.aws.amazon.com/eks/latest/userguide/setting-up.html)
