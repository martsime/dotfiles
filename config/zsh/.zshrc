export DOTREPO=$HOME/.dotfiles
export PATH=/usr/local/bin:/usr/bin:/bin:/$HOME/.local/bin

# Add all scripts from dotfiles to path
export PATH="$PATH:$DOTREPO/tools"

# ----------------- ZPLUG -----------------
# Path to zplug
export ZPLUG_HOME=$DOTREPO/config/zplug

# Cache zplug plugins in order to improve zsh startup time
export ZPLUG_USE_CACHE=true

# Load zplug packages from the following path
export ZPLUG_LOADFILE="$DOTREPO/scripts/packages.zplug"

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
    echo "Installing zplug..."

    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source $ZPLUG_HOME/init.zsh && zplug update --self

    echo "Zplug has been installed"
fi

# Source zplug package manager script
source "$ZPLUG_HOME/init.zsh"

# Load plugins
zplug load

# ----------------- CUSTOM ZSH SCRIPTS -----------------
# Directory with all custom scripts to be autoloaded
AUTOLOAD="$DOTREPO/autoload"

# Source all files in $AUTOLOAD with file extensions .zsh
for file in $AUTOLOAD/*.zsh; do
    source "$file"
done

# ----------------- USER CONFIGURATION ----------------- 
#
# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Vim
export VIM="" # This is needed for python host to load correctly in nvim

# Fzf
export FZF_DEFAULT_COMMAND='rg --smart-case --files --hidden --follow --glob "!.git/*"'

# Nodejs version manager
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git
export GIT_EDITOR="nvim"
