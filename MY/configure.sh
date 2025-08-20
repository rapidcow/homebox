#!/bin/sh
set -e
command -v pnpm >/dev/null || {
    echo pnpm not found >&2
    echo TIP: install pnpm using: >&2
    echo '# npm install -g pnpm' >&2
    exit 1
}
echo pnpm ok
