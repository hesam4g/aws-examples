# IAM policy example


## Convert to json

```sh
yq -o json policy.yaml > policy.json
```

## Create an IAM Policy

```sh
aws iam create-policy \
    --policy-name access-to-s3 \
    --policy-document file://policy.json
```

## Attach Policy to user

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::546358762866:policy/access-to-s3 \
--user-name hesam-admin
```