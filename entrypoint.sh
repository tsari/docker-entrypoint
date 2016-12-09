#!/bin/bash
# general good practice (stop on error, missing variables):
set -eu
groupadd --system --gid=$GID $USER && useradd --system --gid=$GID --uid=$UID $USER >> /dev/null

if [ $? = 0 ]; then
    exec sudo --preserve-env -u $USER "$@"
else
    exec "$@"
fi