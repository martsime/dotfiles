#!/bin/sh

# Path to DOTREPO is needed
if [[ -z "$DOTREPO" ]]; then
    echo "ERROR: Failed to setup python. Env variable DOTREPO is not set."
    exit 1
fi

VERSION2="2.7.16"
VERSION3="3.6.9"

# Install pyenv
echo "Installing pyenv"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Install correct versions of python and enable it
echo "Installing python${VERSION2}"
pyenv install ${VERSION2}

echo "Installing python${VERSION3}"
pyenv install ${VERSION3}

# Init pyenv
eval "$(pyenv init -)"

# Create virtualenvironments for pip
echo "\nCreate virtual environments for neovim2"
pyenv local ${VERSION2}
pip install --upgrade pip  # Update
echo $(pyenv which python)
pyenv local ${VERSION3}
echo $(pyenv which python)


