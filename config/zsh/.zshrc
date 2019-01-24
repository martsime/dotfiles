export DOTREPO=$HOME/.dotfiles
export PATH=/usr/local/bin:/usr/bin:/bin

# Add all scripts from dotfiles to path
export PATH="$PATH:$DOTREPO/tools"

# ----------------- OH-MY-ZSH ----------------- 
# Path to oh-my-zsh
export ZSH=$XDG_CONFIG_HOME/oh-my-zsh

# Set theme with oh-my-zsh
export ZSH_THEME="agnoster"

# Set plugins 
plugins=(
  git
)

# Install oh-my-zsh if its not installed
if [[ ! -d "$ZSH" ]]; then
    echo "Installing oh-my-zsh..."

    git clone git@github.com:robbyrussell/oh-my-zsh.git $ZSH
    echo "Done installing oh-my-zsh."
fi

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ----------------- USER CONFIGURATION ----------------- 

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/local/bin/virtualenvwrapper.sh

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
