#!/bin/sh
set -e
prefix="/usr/local/opt/homebox@$(git describe --tags HEAD)"
set -x
make install prefix="$prefix"
