#!/bin/bash

echo
echo "Name: $1"
echo "Ouput Format(s): $2"
echo "S3: $3"
echo "Compress: $4"
echo "Latest: $5"
echo

for format in $2
do
  library archive --name $1 -o $format $3 $4 $5
done
