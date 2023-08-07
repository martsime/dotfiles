# /bin/bash

# Install brew

eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing brew"
if which brew >/dev/null 2>&1; then
	echo "Brew is already installed"
else
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install packages from brew
echo "Brew install packages"
brew bundle install
