#!/bin/sh
# Yes, really, a script this simple but, rule #1, if
# you are gonna do something more than twice--script

[[ -e /usr/bin/nvim ]] && mkdir -p .config/nvim/syntax && cp -f syntax/mmarkdown.vim $HOME/.config/nvim/syntax/

while [[ -e /usr/bin/vim  ]] ; do

	printf "[1mDo you want me to add it to Vim[0m(y/n)? " && read ANSWER

	if [[ $ANSWER = "y" ]]; then {
		printf "Got it...\n"
		mkdir -p $HOME/.vim/syntax
		cp -f syntax/mmarkdown.vim $HOME/.vim/syntax/
		break
	} elif [[ $ANSWER = "n" ]]; then {
		printf "Good, no bloat--gotta keep that Home folder clean!\n"
		break
	} else {
		printf "Please either type [1;4mexactly[0m ’y’ or ‘n’...\n"
	} fi
done

printf "[1mdone.[0m\n"
