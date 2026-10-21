#!/bin/bash

set -euo pipefail

# shellcheck source-path=SCRIPTDIR source=common.sh
source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

function is_allowed() {
    local JOB_RESULT=$1

    case "${JOB_RESULT}" in
        cancelled) [[ "${INPUT_CANCELLED_ALLOWED}" == "true" ]] ;;
        failure) [[ "${INPUT_FAILURE_ALLOWED}" == "true" ]] ;;
        skipped) [[ "${INPUT_SKIP_ALLOWED}" == "true" ]] ;;
        success) [[ "${INPUT_SUCCESS_ALLOWED}" == "true" ]] ;;
        *)
            echo "  unknown result"
            return 1
            ;;
    esac
}

function main() {
    # Empty values are valid: an empty flag reads as not `true`; an empty or `{}` needs_json reads as one job with an
    # unknown result, so it collects `failure`
    INPUT_NEEDS_JSON=${INPUT_NEEDS_JSON?"INPUT_NEEDS_JSON is not set"}
    INPUT_CANCELLED_ALLOWED=${INPUT_CANCELLED_ALLOWED?"INPUT_CANCELLED_ALLOWED is not set"}
    INPUT_FAILURE_ALLOWED=${INPUT_FAILURE_ALLOWED?"INPUT_FAILURE_ALLOWED is not set"}
    INPUT_SKIP_ALLOWED=${INPUT_SKIP_ALLOWED?"INPUT_SKIP_ALLOWED is not set"}
    INPUT_SUCCESS_ALLOWED=${INPUT_SUCCESS_ALLOWED?"INPUT_SUCCESS_ALLOWED is not set"}
    INPUT_FAIL_ON_FAILURE=${INPUT_FAIL_ON_FAILURE?"INPUT_FAIL_ON_FAILURE is not set"}

    local RESULT="success"
    local ENTRY JOB_NAME JOB_RESULT

    while read -r ENTRY; do
        JOB_NAME=$(echo "${ENTRY}" | jq -r '.key')
        JOB_RESULT=$(echo "${ENTRY}" | jq -r '.value.result')

        echo "${JOB_NAME}: ${JOB_RESULT}"

        if ! is_allowed "${JOB_RESULT}"; then
            echo "  not allowed"
            RESULT="failure"
        fi
    done <<< "$(echo "${INPUT_NEEDS_JSON}" | jq -c 'to_entries[]')"

    echo "Total Result: ${RESULT}"
    set_output "result" "${RESULT}"

    if [[ "${RESULT}" == "failure" && "${INPUT_FAIL_ON_FAILURE}" == "true" ]]; then
        print_error "Total result is failure"
        exit 1
    fi
}

main "$@"
