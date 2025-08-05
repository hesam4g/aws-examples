# S3 Encryption example


## Create a bucket
```sh
 aws s3api create-bucket \
    --bucket hesam-encryption-example \
    --create-bucket-configuration="LocationConstraint=ca-central-1"
 ```

## Copy an object to the bucket with default encryption
```sh
aws s3api put-object \
    --bucket hesam-encryption-example \
    --key sag.txt \
    --body ../hesam-test.txt
```

## Copy an object with encryption of KMS
### Check the available keys in kms
```sh
aws kms list-key
```
```sh
aws s3api put-object \
    --bucket hesam-encryption-example \
    --key sag.txt \
    --body ../hesam-test.txt \
    --server-side-encryption aws:kms \ 
    --ssekms-key-id <KEY_ID>
```