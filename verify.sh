#!/usr/bin/env bash

set -x
set -e

# Keeping around this commented code in case github decides to start being a pain again
#git log --graph --all
# shellcheck disable=SC2034
#gitOutput=$(git show --pretty=full)

verifyDelay=$(git show --pretty=full | awk '/^    verify-delay:/ { print $2 }')
verifyResult=$(git show --pretty=full | awk '/^    verify-result:/ { print $2 }')

if [[ "$verifyDelay" -gt 0 ]]; then
  echo "Delaying $verifyDelay seconds"
  sleep "$verifyDelay"
fi

if [[ "$verifyResult" ]]; then
  echo "Exiting with code $verifyResult"
  exit "$verifyResult"
else
    echo "Verify result not found in commit body, exiting success by default"
    exit 0
fi
