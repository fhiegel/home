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
alias jacoco='mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent install org.jacoco:jacoco-maven-plugin:report'
