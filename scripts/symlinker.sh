#!/bin/bash

# Assumes this scripts is in a subfolder of the dotfile repo
SCRIPTPATH="$(dirname $0)"
export DOTREPO="$(cd $SCRIPTPATH && cd .. && pwd -P)"

echo -e "\nSymlinking config directory\n"

if [ "$HOME/.config" -ef "$DOTREPO/config" ]
then
    echo -e "\"$HOME/.config\" is already symlinked"
else
    echo -e "\"$HOME/.config\" has not been symlinked yet"
   
    while true; do

	# Ask for confirmation before symlinking
	echo -n "Symlink now (y/n): "
	read REPLY

	if [[ $REPLY =~ ^[Yy]$ ]]
	then
	    if [[ -d $HOME/.config ]]
	    then
	        # If $HOME.config already exist, keep a backup
	        mv $HOME/.config $HOME/.old-config
	    fi
	
	    # Symlink $HOME/.config to the dotfile config
	    ln -svf $DOTREPO/config $HOME/.config
	    echo "Symlinks created"
	    break
    	elif [[ $REPLY =~ ^[Nn]$ ]]
	then
	    echo "Exits without symlinking"
	    break
	else
	    echo -e "Unable to understand: \"$REPLY\""
        fi
    done
fi

