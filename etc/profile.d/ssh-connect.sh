ssh-connect() {
	eval $(ssh-agent -s) && find  ~/.ssh -name "id_*" ! -name "*.pub" -exec ssh-add {} \;
}
