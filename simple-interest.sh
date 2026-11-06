#!/bin/bash
# Calculates simple interest from a principal, an annual interest rate (%),
# and a time period in years. Decimals are supported.
#
# Usage:
#   bash simple-interest.sh                 # interactive prompts
#   bash simple-interest.sh <p> <r> <t>     # e.g. bash simple-interest.sh 1000 2.5 3
#
# Formula: simple interest = p * r * t / 100
#
# Author: Upkar Lidder (IBM)
# Additional authors: AugmentChris

is_number() {
  [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]
}

read_number() {
  local prompt=$1 value
  while true; do
    read -r -p "$prompt" value || { echo; echo "No input received." >&2; exit 1; }
    if is_number "$value"; then
      echo "$value"
      return
    fi
    echo "Please enter a non-negative number (e.g. 1500 or 2.5)." >&2
  done
}

if [[ $# -eq 3 ]]; then
  p=$1 r=$2 t=$3
  for v in "$p" "$r" "$t"; do
    if ! is_number "$v"; then
      echo "Error: '$v' is not a non-negative number." >&2
      exit 1
    fi
  done
elif [[ $# -eq 0 ]]; then
  p=$(read_number "Enter the principal: ")
  r=$(read_number "Enter the annual interest rate (%): ")
  t=$(read_number "Enter the time period in years: ")
else
  echo "Usage: $0 [principal rate years]" >&2
  exit 1
fi

interest=$(awk -v p="$p" -v r="$r" -v t="$t" 'BEGIN { printf "%.2f", p * r * t / 100 }')
total=$(awk -v p="$p" -v i="$interest" 'BEGIN { printf "%.2f", p + i }')

echo "Simple interest: $interest"
echo "Total amount:    $total"
