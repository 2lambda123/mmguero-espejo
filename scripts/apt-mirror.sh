#!/usr/bin/env bash

set -e
set -o pipefail

ENCODING="utf-8"

KEY_URLS_FILE=${GPG_KEY_URLS_FILE:-"/etc/apt/gpg-key-urls.list"}

[[ -n $KEY_URLS_FILE ]] && [[ -r "$KEY_URLS_FILE" ]] && \
  ( grep ^http "$GPG_KEY_URLS_FILE" | xargs -r -n 1 -I XXX bash -l -c "echo 'XXX' ; curl -fsSL 'XXX' | sudo apt-key add - 2>/dev/null" || true ) || true

/usr/bin/apt-mirror "$@"
