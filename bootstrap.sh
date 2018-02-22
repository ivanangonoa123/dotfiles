#!/bin/bash

git pull origin master;

function doIt() {
	#move everything to home
	rsync -av --exclude ".git/" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "settings/"
		--exclude "install/rc.local" 
		-avh --no-perms . ~;

	#move rc.local to /etc/
	rsync -av install/rc.local /etc/;

	source ~/.bashrc;
	source /etc/rc.local;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
