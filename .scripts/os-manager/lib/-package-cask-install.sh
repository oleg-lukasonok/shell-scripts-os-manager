#!/bin/bash
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

. ./.scripts/os-manager/lib/-is-package-installed.sh

_osManager_packageCaskInstall() {
    local FUNCTION_NAME="_osManager_packageCaskInstall"
    _loggers_debug "${FUNCTION_NAME}"

    local TMP_OS_PACKAGE="${OS_PACKAGE}"
    if
        [ -z "${TMP_OS_PACKAGE}" ]
    then
        TMP_OS_PACKAGE="${1}"
    fi

    local IS_INSTALLED=$(
        _osManager_isPackageInstalled "${TMP_OS_PACKAGE}"
    )

    if
        [ "${IS_INSTALLED}" = false ]
    then
        _loggers_emptyLine
        brew install --cask "${TMP_OS_PACKAGE}"
        _loggers_emptyLine
    else
        _loggers_warn "${FUNCTION_NAME}"
        _loggers_warn "${FUNCTION_NAME}" "Skiping package ${TMP_OS_PACKAGE} installation - it is already installed!"
        _loggers_warn "${FUNCTION_NAME}"
    fi
}
