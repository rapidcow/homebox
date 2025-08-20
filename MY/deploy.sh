#!/bin/sh
set -e
version="$(git describe --tags HEAD)"
git diff-index --exit-code HEAD -- >/dev/null || version="$version-dirty"

(
    set -x
    make install prefix="/usr/local/opt/homebox@$version"
    ln -sf "homebox@$version" /usr/local/opt/homebox
)
