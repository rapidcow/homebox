#!/bin/sh
set -e
version="$(git describe --tags HEAD)"
git diff-index --exit-code HEAD -- >/dev/null || version="$version-dirty"

(
    set -x
    make install prefix="/usr/local/opt/homebox@$version"
    # ln -f seeems to still create the symlink inside
    # the (symlinked) directory.
    ! test -L /usr/local/opt/homebox || rm /usr/local/opt/homebox
    ln -sf "homebox@$version" /usr/local/opt/homebox
)
