#!/bin/bash

COMMAND=$*
BASEDIR=$(dirname $(dirname $0))

declare -a down=(monitoring ksqldb connect cluster elasticsearch oracle mysql network)

for compose in ${down[@]}; do
  bash -c "echo && echo $compose && cd $BASEDIR/$compose && docker-compose $COMMAND"
done

