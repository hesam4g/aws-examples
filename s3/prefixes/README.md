# Prefix Example


## Create a bucket
```sh
aws s3 mb s3://hesam-bucket-prefix-example
```


## Copy an object
```sh
aws s3api put-object \
    --bucket hesam-bucket-prefix-example \
    --key sag.txt \
    --body ../hesam-test.txt
```

## Create a folder
```sh
aws s3api put-object \
    --bucket hesam-bucket-prefix-example \
    --key "virtual-folder/"
```


## Create a few folders
```sh
aws s3api put-object \
    --bucket hesam-bucket-prefix-example \
    --key "folder1/folder2/folder3"
```

## Copy a file to the virtual folder
```sh
aws s3api put-object \
    --bucket hesam-bucket-prefix-example \
    --key "folder1/folder2/folder3/copied-hesam-test.txt" \
    --body "../hesam-test.txt"
```
