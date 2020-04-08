#!/bin/bash

# Usage:
# Go into cmd loop: sudo ./leopays-cli.sh
# Run single cmd:  sudo ./leopays-cli.sh <leopays-cli paramers>

PREFIX="docker-compose exec leopays_node leopays-cli"
if [ -z $1 ] ; then
  while :
  do
    read -e -p "leopays-cli " cmd
    history -s "$cmd"
    $PREFIX $cmd
  done
else
  $PREFIX "$@"
fi
