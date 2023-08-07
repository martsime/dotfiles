#!/bin/sh
# This script is the entry point for initializing the dotfiles.
# It does all the required setup

# Set the path of the dotrepo, which is required for the other scripts to work.
export DOTREPO="$( cd "$(dirname "$0")" ; cd ../ ; pwd -P )"

# Output formatting shortcuts
BOLDSTART="\033[1m" # Start of a bold string
BOLDEND="\033[0m" # End of a bold string

echo "${BOLDSTART}Installing dotfiles:\n${BOLDEND}"

# Run symlinker
echo "${BOLDSTART}Running symlinker${BOLDEND}"
$DOTREPO/scripts/symlinker.sh
if [[ $? -eq 0 ]] ; then
    echo "${BOLDSTART}Symlinker done\n${BOLDEND}"
else
    echo "${BOLDSTART}ABORTING SETUP!${BOLDEND}"
    exit 1
fi

