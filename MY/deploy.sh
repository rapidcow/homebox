#!/bin/sh
set -e
version="$(git describe --tags HEAD)"
git diff-index --exit-code HEAD -- >/dev/null || version="$version-dirty"

(
    set -x
    make install prefix="/usr/local/opt/homebox@$version/homebox"
    stow -d /usr/local/opt/"homebox@$version" homebox
)
