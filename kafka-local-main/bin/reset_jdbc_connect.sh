#!/bin/sh

DATE="2020/10/01"


SOURCE=sds-entpr-source
TABLE=SDS_MAIN.SDS_ENTPR_SOURCE

KEY=$(cat <<EOF
["${SOURCE}",{"protocol":"1","table":"${TABLE}"}]
EOF
)


if [[ "Darwin" == "$(uname)" ]]; then
 #macos
 epoch=$(date -j -u -f "%Y/%m/%d %H:%M:%S" "${DATE} 00:00:00" "+%s000")
else
 #linux
 epoch=$(date -d '${DATE} 00:00:00' +"%s")
fi


VALUE=$(cat <<EOF
{"timestamp_nanos":0,"timestamp":${epoch}}
EOF
)

MESSAGE=${KEY}\|${VALUE}

BOOTSTRAP_SERVER=localhost:19092,localhost:29092,localhost:39092
TOPIC=connect-cluster-offsets

echo $MESSAGE
exit

echo $MESSAGE | kafka-console-producer --bootstrap-server $BOOTSTRAP_SERVER --topic $TOPIC --property parse.key=true --property key.separator=\|

