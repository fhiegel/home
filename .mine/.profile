#
# HOME CONFIGURATION
#
if [ -z "${MINE_HOME}" ] ; then
    export MINE_HOME="$(readlink -f ~)"
fi

alias home="cd ${MINE_HOME}"
export PATH="${MINE_HOME}/.mine/bin/:$PATH"

#
# DEV HOME
#
if [ -z "${DEV_HOME}" ] ; then
  export DEV_HOME='/develop'
fi

alias dev="cd ${DEV_HOME}"
export PATH="${DEV_HOME}/tools/bin/:$PATH"

#
# Colors
#
export COLORS=${MINE_HOME}/.mine/.color-import
source $COLORS

#
# Bannière de démarrage
#
# smllant
if [ -z "$mine_banner_loaded" ]; then
  cat ${MINE_HOME}/.mine/banner
  mine_banner_loaded=true
fi

#
# CONFIGURATION DU PROMPT GIT
#
source "${MINE_HOME}/.gitsettings/layout"

#
# Dev HOME && ALIAS
#
alias katas="cd ${DEV_HOME}/katas"

#
# Firefox
#
alias fox-mine='firefox -P fhiegel-mine'
alias fox-search='firefox -foreground -search'

#
# OPEN
#
alias gnopen='gnome-open'

export JACOCO_VERSION=0.8.2;

jacoco() { 
  __jacoco_generate_report $*
}
__jacoco_generate_report() { 
  mvn clean org.jacoco:jacoco-maven-plugin:${JACOCO_VERSION}:prepare-agent install org.jacoco:jacoco-maven-plugin:${JACOCO_VERSION}:report $*
}
