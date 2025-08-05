# Policy example


## Create a bucket
```sh
 aws s3api create-bucket \
    --bucket hesam-bucket-policy-example \
    --create-bucket-configuration="LocationConstraint=ca-central-1"
 ```

 ## Copy an object to the bucket
```sh
aws s3api put-object \
    --bucket hesam-bucket-policy-example \
    --key sag.txt \
    --body ../hesam-test.txt
```


## Change Public Policies

```sh
aws s3api put-public-access-block \
    --bucket hesam-bucket-policy-example \
    --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false
```

## Grant list and read for all users
```sh
aws s3api put-bucket-policy \
    --bucket hesam-bucket-policy-example \
    --policy file://policy.json
```