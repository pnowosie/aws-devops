# expect AWS CLI recent version
[[ $(aws --version | cut -d/ -f2) == 2\.* ]] || fail "AWS CLI version mismatch"