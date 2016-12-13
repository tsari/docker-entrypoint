#!/bin/bash
# general good practice (stop on error):
set -e
if [ ! -z $GID ]; then
    groupadd --system --gid=$GID $USER && useradd --system --gid=$GID --uid=$UID $USER
    exec sudo --preserve-env -u $USER "$@"
else
    exec "$@"
fi