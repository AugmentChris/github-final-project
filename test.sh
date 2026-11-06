#!/bin/bash
# Tests for simple-interest.sh
set -u
cd "$(dirname "$0")" || exit 1
fail=0

check() {
  local name=$1 expected=$2 actual=$3
  if [[ "$actual" == "$expected" ]]; then
    echo "ok   - $name"
  else
    echo "FAIL - $name: expected '$expected', got '$actual'"
    fail=1
  fi
}

check "whole numbers" "Simple interest: 100.00" "$(bash simple-interest.sh 1000 5 2 | head -1)"
check "decimal rate" "Simple interest: 75.00" "$(bash simple-interest.sh 1000 2.5 3 | head -1)"
check "total amount" "Total amount:    1075.00" "$(bash simple-interest.sh 1000 2.5 3 | tail -1)"
check "interactive re-prompts on bad input" "Simple interest: 75.00" "$(printf 'abc\n1000\n2.5\n3\n' | bash simple-interest.sh 2>/dev/null | head -1)"

bash simple-interest.sh 1000 x 3 >/dev/null 2>&1
check "rejects non-numeric argument" "1" "$?"
bash simple-interest.sh 1000 -5 3 >/dev/null 2>&1
check "rejects negative argument" "1" "$?"
bash simple-interest.sh 1000 5 >/dev/null 2>&1
check "rejects wrong argument count" "1" "$?"

exit $fail
