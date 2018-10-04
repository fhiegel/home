#
# Bannière de démarrage
#
# smllant
if [ -z "$mine_banner_loaded" ]; then
  cat ~/.mine/banner
  mine_banner_loaded=true
fi

#
# Defaults
#
alias home='cd ~'
export PATH="~/.mine/bin/:$PATH"

#
# CONFIGURATION DU PROMPT GIT
#
. ~/.gitsettings/layout

#
# Colors
#
export COLORS=~/.mine/.color-import
. $COLORS

#
# Dev HOME && ALIAS
# 
export DEV_HOME='/development'
alias dev="cd $DEV_HOME"
alias katas='home && cd workspaces/katas'

export PATH=$HOME/tools/apache-maven/bin:$PATH

#
# Firefox
#

alias fox-mine='firefox -P fhiegel-mine'
alias fox-search='firefox -foreground -search'


alias gnopen='gnome-open'

export JACOCO_VERSION=0.8.2;

jacoco() {
  __jacoco_generate_report $*
  __jacoco_show_report
}
__jacoco_generate_report() {
  mvn clean org.jacoco:jacoco-maven-plugin:${JACOCO_VERSION}:prepare-agent install org.jacoco:jacoco-maven-plugin:${JACOCO_VERSION}:report $*
}
__jacoco_show_report() {
  firefox target/site/jacoco/index.html
}

