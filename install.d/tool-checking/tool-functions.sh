#!/usr/bin/env bash

TOOLS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TOOLS_CHECKLIST="${TOOLS_DIR}/list"
echo "${TOOLS_DIR}"
echo "${TOOLS_CHECKLIST}"

cmdexist() { $(hash "$1" 2>/dev/null); }
require() { cmdexist $1 || echo -e "${BROWN}Tool: \"$1\" is not installed.\n${NC}"; }

_add_tool() {
        echo "Add '$1' in ${BASH_SOURCE}"
        tools+="$1"
        echo "tools+=$1" >> $TOOLS_CHECKLIST
}

_check_tools() {
	IFS=$'\n' read -d '' -r -a local tools < "${TOOLS_DIR}/list"
	
	for value in ${tools[@]}
        do
		echo "tool: $value"
        require $value
        done
}
