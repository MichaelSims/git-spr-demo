#!/usr/bin/env bash

set -x
set -e

gitOutput=$(git show --pretty=full)
verifyDelay=$(git show --pretty=full | awk '/^    verify-delay:/ { print $2 }')
verifyResultAfterDelay=$(git show --pretty=full | awk '/^    verify-result-after-delay:/ { print $2 }')

if [[ "$verifyDelay" -gt 0 ]]; then
  echo "Delaying $verifyDelay seconds"
  sleep "$verifyDelay"
fi

if [[ "$verifyResultAfterDelay" ]]; then
  echo "Exiting with code $verifyResultAfterDelay"
  exit "$verifyResultAfterDelay"
else
    exit 255
fi
