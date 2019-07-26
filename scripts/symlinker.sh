#!/bin/bash
# Script to symlink home directory and config files

if [[ -z "$DOTREPO" ]]; then
    echo "ERROR: Failed to symlink. Env variable DOTREPO is not set."
    exit 1
fi

# Glob hidden files
shopt -s dotglob

# Symlink all dotfiles in home directory
echo -e "Symlinking dotfiles in home directory"
ln -svf $DOTREPO/home/* $HOME

# Symlink the config directory
echo -e "Symlinking config directory"

if [ "$HOME/.config" -ef "$DOTREPO/config" ]
then
    echo -e "\"~/.config\" is already symlinked"
else
    echo -e "\"~/.config\" has not been symlinked yet"
   
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
            echo -e "Already existing \"~/.config\" is moved to \"~/.old-config\""
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

