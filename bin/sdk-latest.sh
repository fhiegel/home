#!/usr/bin/env bash

POSITIONAL="$#"
SDK_NAME="${POSITIONAL[1]}"
SDK_VERSION="${POSITIONAL[2]}"

eval "sdk"

sdk l "${SDK_NAME}" | grep -e "installed" -e "local only" | awk -F\| '{ print $6 }' | grep -e "${SDK_VERSION}" | head -1
# alias java8='sdk use java 8.0.192-zulu'
# alias java10='sdk use java 10.0.2-zulu'
# alias java11='sdk use java 11.0.1-zulu'
# alias java13='sdk use java 13.0.2-zulu'
