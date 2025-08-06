# STS example

## Create a user with no permission
We need to create a new user with no permissions and generate out access keys.

```sh
aws iam create-user --user-name sts-hesam
aws iam create-access-key --user-name sts-hesam --output table
```

Set the new AccessKeyId and SecretAccessKey
```sh
aws configure
```
Open the credential file and set the "sts" profile
```sh
open ~/.aws/credentials
```

Test who you are:
```sh
aws sts get-caller-identity --profile sts
```

Make sure you don't have access to s3:
```sh
aws s3 ls --profile sts
```
> An error occurred (AccessDenied) when calling the ListBuckets operation: User: arn:aws:iam::546358762866:user/sts-hesam is not authorized to perform: s3:ListAllMyBuckets because no identity-based policy allows the s3:ListAllMyBuckets action

## Create a role
We need to create a role that will access a new resource
```sh
./bin/deploy
```

## Use new user credentials and assume role

```sh
aws sts assume-role \
    --role-arn arn:aws:iam::546358762866:role/my-sts-fun-stack-StsRole-yo7juebqol4w \
    --role-session-name hesam-session-name \
    --profile sts
```

Test who you are and check s3 buckets:
```sh
aws sts get-caller-identity --profile assumed
aws s3 ls --profile assumed 
```

## Clearup
tear down your cloudformation stack via the AWS Management Console

```sh
aws iam delete-user-policy --user-name sts-hesam --policy-name StsAssumePolicy
aws iam list-access-keys --user-name sts-hesam
aws iam delete-access-key --access-key-id <ACCESS_KEY> --user-name sts-hesam
aws iam delete-user --user-name sts-hesam
aws cloudformation delete-stack --stack-name my-sts-fun-stack
```


