#
# Bannière de démarrage
#
# smllant
if [ -z "$mine_banner_loaded" ]; then
  cat ${MINE_HOME}/etc/banner
  mine_banner_loaded=true
fi
