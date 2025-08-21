#!/bin/sh
set -e

(
    set -x
    make -f Makefile.init install prefix="/usr/local/opt/homebox-init"
    stow -d /usr/local/opt -S homebox-init
)
