#!/bin/bash

set -o pipefail

rm -rf .tmp
mkdir -p .tmp/{config,bin}
export CFG_DIR=.tmp/config
export BIN_DIR=.tmp/bin

ERR=""
ERR_FLAG=false

COLR='\033[0;31m'
COLG='\033[0;32m'
COLN='\033[0m' # No Color

print_red() { echo -e "$COLR$1$COLN"; }
print_green() { echo -e "$COLG$1$COLN"; }

reset_err() {
    ERR_FLAG=false
}

set_err() {
    ERR_FLAG=true
    e="ERROR: $1"
    >&2 echo "$e"
    ERR+="$e\n"
}

expected_list_items=(
'3.11.0'
'4.6'
)

actual_list=$(./oc-select list)

for version in "${expected_list_items[@]}"; do
    echo "TEST: v$version"
    echo "$actual_list" | grep "v$version" || set_err "expected version $version missing from list"

    ./oc-select "$version"
    [[ -f "$CFG_DIR/v$version/oc" ]] || set_err "binary not found at $CFG_DIR/v$version/oc"
    [[ $(readlink .tmp/bin/oc) == "$CFG_DIR/v$version/oc" ]] || set_err "invalid link for $version"

    if [ $ERR_FLAG == true ]; then
        print_red "FAILED"
    else
        print_green "OK"
    fi
done

[[ "$ERR" == "" ]] || exit 1
