# NACL Example


## Get VPC ID

```sh
VPC_ID=$(aws ec2 describe-vpcs \
  --filters "Name=tag:Name,Values=nacl-example-vpc" \
  --query "Vpcs[0].VpcId" \
  --output text) && \
echo "VPC_ID: $VPC_ID"
```

## Create NACL

```sh
aws ec2 create-network-acl --vpc-id $VPC_ID
```

## Get AMI for Amazon Linux 2

Grab the latest AML2 AMI and set in ``template.yaml`` file.
```sh
aws ec2 describe-images \
    --owners amazon \
    --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
    --query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
    --region ca-central-1 \
    --output text
```

## Get the VPS's SubnetID 
Grab the SubnetID and copy it into ``template.yaml`` file.

```sh
aws ec2 describe-subnets \
  --filters "Name=vpc-id,Values=$VPC_ID" \
  --query "Subnets[*].SubnetId" \
  --output text
```


## ADD a rule

```sh
aws ec2 create-network-acl-entry \
  --network-acl-id acl-0ddc1fa75ac5d7d83 \
  --ingress \
  --rule-number 90 \
  --protocol -1 \
  --port-range From=0,To=65535 \
  --cidr-block 174.88.55.199/32 \
  --rule-action deny
```