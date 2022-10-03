#!/usr/bin/env bash

TOOLS_CHECKLIST="$(readlink -f "${BASH_SOURCE}")"
tools=()

cmdexist() { $(hash "$1" 2>/dev/null); }
require() { cmdexist $1 || echo -e "${BROWN}Tool: \"$1\" is not installed.\n${NC}"; }

add_tool() {
	echo "Add '$1' in ${BASH_SOURCE}"
	tools+="$1"
	echo "tools+=$1" >> $TOOLS_CHECKLIST
}

check_tools() {
	for value in ${tools[@]}
	do
	require $value
	done
}

tools+=(git)
tools+=(sdk)
tools+=(jq)
tools+=(yq)
tools+=(fzf)
tools+=(bat)
