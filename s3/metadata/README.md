# Metadata Example


## Create a bucket
```sh
aws s3 mb s3://hesam-bucket-metadata-example
```


## Copy an object with custom metadata
```sh
aws s3api put-object \
    --bucket hesam-bucket-metadata-example \
    --key sag.txt \
    --body ../hesam-test.txt \
    --metadata metadata1=value1,metadata2=value2
```

## Check the metadata after putting the file
```sh
aws s3api head-object \
    --bucket hesam-bucket-metadata-example \
    --key sag.txt 
```


## Copy and replace one metadata 
```sh
aws s3api copy-object \
  --bucket hesam-bucket-metadata-example \
  --key sag.txt \
  --copy-source hesam-bucket-metadata-example/sag.txt \
  --metadata-directive REPLACE \
  --metadata metadata1=value1
```

## Check the value of metadata 1
```sh
aws s3api head-object \
  --bucket hesam-bucket-metadata-example \
  --key sag.txt \
  --query 'Metadata.metadata1' \
  --output text
```