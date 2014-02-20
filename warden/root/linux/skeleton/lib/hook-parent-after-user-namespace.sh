#!/bin/bash

[ -n "$DEBUG" ] && set -o xtrace
set -o nounset
set -o errexit
shopt -s nullglob

cd $(dirname $0)/../

source ./etc/config

exit 0

cat > /proc/$PID/uid_map <<EOF
$user_uid 0 1
EOF

cat > /proc/$PID/gid_map <<EOF
$user_uid 0 1
EOF

#echo "0 $user_uid 1" > /proc/$PID/uid_map
#echo "0 $user_uid 1" > /proc/$PID/gid_map
