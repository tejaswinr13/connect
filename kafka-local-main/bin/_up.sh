#!/bin/bash

COMMAND=$*
BASEDIR=$(dirname $(dirname $0))

declare -a up=(network mysql oracle elasticsearch cluster connect ksqldb monitoring)

for compose in ${up[@]}; do
  bash -c "echo && echo $compose && cd $BASEDIR/$compose && docker-compose $COMMAND"
done

