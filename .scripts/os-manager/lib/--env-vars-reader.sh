#!/bin/bash
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/base/lib/--env-vars-reader.sh

export OS_PACKAGE=""

ALL_ARGS=("$@")
while [[ "$#" -gt 0 ]]; do
    case $1 in
    --os-package)
        export OS_PACKAGE="$2"
        ;;
    *) ;;
    esac
    shift
done
set -- "${ALL_ARGS[@]}"
