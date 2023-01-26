#!/bin/sh

# needed for urandom
export LC_CTYPE=C


if [ $# -lt 1 ]; then
  echo "usage: $0 file"
  exit
fi

FILE=$1
shift

if [ ! -f $FILE ]; then
  echo "file $FILE does not exist or is not a standard file."
  exit
fi

BOOTSTRAP_SERVER=localhost:19092,localhost:29092,localhost:39092

TOPIC=enterprise-api-device-v0

SOURCE_ID=$(cat /dev/urandom | tr -dc '0-9' | fold -w 14 | head -n 1)

echo $SOURCE_ID


cat $FILE | tr -d '\n' | sed s/#SOURCE_ID#/${SOURCE_ID}/g | kafka-console-producer --bootstrap-server $BOOTSTRAP_SERVER --topic $TOPIC

