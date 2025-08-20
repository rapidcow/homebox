#!/bin/sh
set -e
prefix="/usr/local/opt/homebox@$(git describe --tags HEAD)"
git diff-index --exit-code HEAD -- >/dev/null || prefix="$prefix-dirty"
set -x
make install prefix="$prefix"
