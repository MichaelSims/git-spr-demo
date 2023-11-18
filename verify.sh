#!/usr/bin/env bash

set -x
set -e


git log --graph --all

# shellcheck disable=SC2034
gitOutput=$(git show --pretty=full)
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
    exit 255
fi
