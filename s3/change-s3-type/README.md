# Change S3 type example


## Create a bucket
```sh
aws s3 mb s3://hesam-bucket-change-type-example
```

## Copy an object to the bucket
```sh
aws s3api put-object \
    --bucket hesam-bucket-change-type-example \
    --key sag.txt \
    --body ../hesam-test.txt
```
## Copy an object to the bucket
```sh
aws s3api put-object \
    --bucket hesam-bucket-change-type-example \
    --key sag2.txt \
    --body ../hesam-test.txt \
    --storage-class STANDARD_IA
```
storage class can be: \
`STANDARD` – default \
`STANDARD_IA` – infrequent access \
`ONEZONE_IA` – single AZ infrequent access \
`INTELLIGENT_TIERING` \
`GLACIER` \
`DEEP_ARCHIVE` \
`REDUCED_REDUNDANCY` (deprecated for most use cases)


## Change the class of an existing bucket
```sh
aws s3api put-object \
    --bucket hesam-bucket-change-type-example \
    --key hesam-test.txt \
    --body ../hesam-test.txt \
    --metadata metadata1=value1,metadata2=value2
```

```sh
aws s3api copy-object \
    --bucket hesam-bucket-change-type-example \
    --key hesam-test.txt \
    --copy-source hesam-bucket-change-type-example/hesam-test.txt \
    --storage-class ONEZONE_IA \
    --metadata-directive COPY
```