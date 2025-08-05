# Access Control List (ACL) example


## Create a bucket
```sh
 aws s3api create-bucket \
    --bucket hesam-bucket-acl-example \
    --create-bucket-configuration="LocationConstraint=ca-central-1"
 ```

 ## Copy an object to the bucket
```sh
aws s3api put-object \
    --bucket hesam-bucket-acl-example \
    --key sag.txt \
    --body ../hesam-test.txt
```


## Get ACL

```sh
aws s3api get-public-access-block --bucket hesam-bucket-acl-example
```

## Change Public Policies

```sh
aws s3api put-public-access-block \
    --bucket hesam-bucket-acl-example \
    --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true
```

## Track the change in ACL

```sh
aws s3api get-public-access-block --bucket hesam-bucket-acl-example
```

## Change bucket ownership

```sh
aws s3api put-bucket-ownership-controls \
    --bucket hesam-bucket-acl-example \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

```sh
aws s3api put-bucket-acl \
    --bucket hesam-bucket-acl-example \
    --acl public-read
```

## Make the sag file publicly available
```sh
aws s3api put-object-acl \
    --bucket hesam-bucket-acl-example \
    --key sag.txt \
    --acl public-read
```