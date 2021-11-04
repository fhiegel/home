alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -lah'

# sdk l java | grep -e "installed" -e "local only" | awk -F\| '{ print $6 }' | grep -e "${version}" | head -1
alias java8='sdk use java 8.0.302-zulu'
alias java10='sdk use java 10.0.2-zulu'
alias java11='sdk use java 11.0.1-zulu'
alias java13='sdk use java 13.0.2-zulu'

#
# OPEN
#
alias gnopen='gnome-open'
alias open='explorer'
