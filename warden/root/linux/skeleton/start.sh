#!/bin/bash

[ -n "$DEBUG" ] && set -o xtrace
set -o nounset
set -o errexit
shopt -s nullglob

cd $(dirname $0)

source ./etc/config

if [ -f ./run/wshd.pid ]
then
  echo "wshd is already running..."
  exit 1
fi

./net.sh setup

export user_uid

strace ./bin/wshd --run ./run --lib ./lib --root $PWD/mnt --title "wshd: $id"
