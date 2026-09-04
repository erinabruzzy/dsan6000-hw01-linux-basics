#!/bin/bash

# TODO: Replace BUCKET_URI once provided by instructor
BUCKET_URI="s3://BUCKET-NAME-HERE"

# 1. List remote contents
aws s3 ls "$BUCKET_URI/"

# 2. Download .csv files into data/
aws s3 cp "$BUCKET_URI/" data/ --recursive --exclude "*" --include "*.csv"

# 3. List local downloaded .csv files
ls data/*.csv
