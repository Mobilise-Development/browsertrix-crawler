#!/bin/bash

BUCKET_NAME="${1:-test_object}"      # If not provided, defaults to 'test_object'
DESTINATION="/app/crawl-config.yaml" # Constructs the destination path

# AWS S3 copy command
aws s3 cp "s3://tnaconvertest/$BUCKET_NAME" "$DESTINATION"

echo "Displaying current crawl configuration: "
cat /app/crawl-config.yaml

gosu root crawl --config /app/crawl-config.yaml
