#!/usr/bin/env bash

if [ -z "${OBSIDIAN_HOME}" ] ; then
    echo "Obsidian : Saisir le répertoire du vault:"
    read -e OBSIDIAN_HOME
    echo "OBSIDIAN_HOME=${OBSIDIAN_HOME}" >> "${MINE_SECRETS}/obsidian.env"
fi
if [ -z "${OBSIDIAN_WORKSPACE}" ] ; then
    read -e -p "Obsidian : Saisir le nom de la machine: " -i "$(hostname)" OBSIDIAN_WORKSPACE
    echo "OBSIDIAN_WORKSPACE=${OBSIDIAN_WORKSPACE}" >> "${MINE_SECRETS}/obsidian.env"
fi

alias o6n="cd ${OBSIDIAN_HOME}"

o6n-pull()
{
  (cd "${OBSIDIAN_HOME}" && git aa && git stash save --quiet && git pull && git stash pop)
}

o6n-save()
{
  NOW=$(date +"%Y-%m-%d")
  MESSAGE="${NOW}: Backup from ${OBSIDIAN_WORKSPACE}"
  (cd "${OBSIDIAN_HOME}" && ssh-connect && git aa && git com -m "${MESSAGE}" && git push)
}
