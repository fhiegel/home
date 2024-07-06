#!/usr/bin/env bash

if [ -z "${OBSIDIAN_HOME}" ] ; then
    echo "Obsidian : Saisir le répertoire du vault:"
    read -e OBSIDIAN_HOME
    echo "OBSIDIAN_HOME=${OBSIDIAN_HOME}" > "${MINE_SECRETS}/obsidian.env"
fi

alias o6n="cd ${OBSIDIAN_HOME}"

o6n-pull()
{
  (cd "${OBSIDIAN_HOME}" && git pull)
}
