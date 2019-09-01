export DOTREPO=$HOME/.dotfiles
export PATH=/usr/local/bin:/usr/bin:/bin

# Add all scripts from dotfiles to path
export PATH="$PATH:$DOTREPO/tools"

# ----------------- ZPLUG -----------------
# Path to zplug
export ZPLUG_HOME=$XDG_CONFIG_HOME/zplug

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

# ----------------- USER CONFIGURATION ----------------- 

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/bin/virtualenvwrapper.sh

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

# Vim
export VIM="" # This is needed for python host to load correctly in nvim

# Fzf
export FZF_DEFAULT_COMMAND='rg --smart-case --files --hidden --follow --glob "!.git/*"'

# Nodejs version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Git
export GIT_EDITOR="nvim"

#Fix font scaling for alacritty
export WINIT_HIDPI_FACTOR=1

# ----------------- ALIASES ----------------- 
# Zsh
alias zshconf="vim ~/.zshrc"
alias sz="source ~/.zshrc"

# Vim
alias vim="nvim"
alias vimconf="vim ~/.config/nvim/init.vim"

# Tmux
alias tma="tmux a -t"
alias tmn="tmux new -s"
alias tml="tmux ls"
alias tmk="tmux kill-session -t"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Start Xorg on Arch
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi
