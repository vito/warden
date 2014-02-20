#!/bin/bash

[ -n "$DEBUG" ] && set -o xtrace
set -o nounset
set -o errexit
shopt -s nullglob

cd $(dirname $0)/../

source ./lib/common.sh

setup_fs

cp bin/wshd mnt/sbin/wshd
chown $user_uid:$user_uid mnt/sbin/wshd
chmod 700 mnt/sbin/wshd
