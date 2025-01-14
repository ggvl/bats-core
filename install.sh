#!/usr/bin/env bash

set -e

BATS_ROOT="${0%/*}"
PREFIX="$1"
LIBDIR="${2:-lib}"

if [[ -z "$PREFIX" ]]; then
  printf '%s\n' \
    "usage: $0 <prefix>" \
    "  e.g. $0 /usr/local" >&2
  exit 1
fi

install -d -m 755 "$PREFIX"/{bin,libexec/bats-core,"${LIBDIR}"/bats-core,share/man/man{1,7}}
install -m 755 "$BATS_ROOT/bin"/* "$PREFIX/bin"
install -m 755 "$BATS_ROOT/libexec/bats-core"/* "$PREFIX/libexec/bats-core"
install -m 755 "$BATS_ROOT/lib/bats-core"/* "$PREFIX/${LIBDIR}/bats-core"
install -m 644 "$BATS_ROOT/man/bats.1.gz" "$PREFIX/share/man/man1"
install -m 644 "$BATS_ROOT/man/bats.7.gz" "$PREFIX/share/man/man7"

echo "Installed Bats to $PREFIX/bin/bats"
