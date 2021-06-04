#!/bin/bash

# doc: Exit the script with error message, you can pass `exit_code` as a 2nd arg
#> fail "unrecoverable error"
#> fail "stops with exit_code 5" 5
fail() {
    echo "$1" >&2
    exit ${2:-1}
}

echo "AWS CLI version check"
[[ $(aws --version | cut -d/ -f2) == 2\.* ]] || fail "AWS CLI version mismatch"


echo "... after the check ..."
