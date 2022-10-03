ssh-connect() {
	eval $(ssh-agent -s) && find  ~/.ssh -name "id_*" -exec ssh-add {} \;
}