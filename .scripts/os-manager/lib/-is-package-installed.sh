#!/bin/bash
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

_osManager_isPackageInstalled() {
    local FUNCTION_NAME="_osManager_isPackageInstalled"

    local RET_VAL=false

    local TMP_OS_PACKAGE="${OS_PACKAGE}"
    if
        [ -z "${TMP_OS_PACKAGE}" ]
    then
        TMP_OS_PACKAGE="${1}"
    fi

    _loggers_debug "${FUNCTION_NAME}" "OS_PACKAGE: ${OS_PACKAGE}"
    _loggers_debug "${FUNCTION_NAME}" "TMP_OS_PACKAGE: ${TMP_OS_PACKAGE}"

    if
        [ -z "${TMP_OS_PACKAGE}" ]
    then
        _loggers_error "${FUNCTION_NAME}"
        _loggers_error "${FUNCTION_NAME}" "!!! Missing required one of (--os-package || 1st ) parameter (OS_PACKAGE)!"
        _loggers_error "${FUNCTION_NAME}"
        exit 1
    fi

    local FOUND=$(
        which "${TMP_OS_PACKAGE}" | grep -v "not found"
    )
    if
        [ -z "${FOUND}" ]
    then
        . $HOME/.zshrc
        FOUND=$(
            eval "${TMP_OS_PACKAGE} --version"
        )
    fi

    if
        [ ! -z "${FOUND}" ]
    then
        RET_VAL=true
    fi
    _loggers_debug "${FUNCTION_NAME}" "RET_VAL: ${RET_VAL}"

    echo "${RET_VAL}"
}
