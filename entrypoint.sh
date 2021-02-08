#!/bin/bash
name=$1
output_format=$2
if [ "$3" = "true" ] ; then s3="--s3"; else s3=''; fi
if [ "$4" = "true" ] ; then compress="--compress"; else compress=''; fi
if [ "$5" = "true" ] ; then latest="--latest"; else latest=''; fi
if [ "$6" != "" ] ; then version="--version $6"; else version=''; fi

for format in $2
do
  library archive --name $name -o $format $s3 $compress $latest $version &
done

wait
library show --help
library show $1

show=$(library show $1)
echo ::set-output name=show::$show
