#!/bin/bash
groupadd --system --gid=$GID $USER && useradd --system --gid=$GID --uid=$UID $USER >> /dev/null

if [ $? = 0 ]; then
    exec sudo --preserve-env -u $USER "$@"
else
    exec "$@"
fi