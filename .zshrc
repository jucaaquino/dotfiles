# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="essembeh"
#ZSH_THEME="duellj"
#ENABLE_CORRECTION="true"
plugins=(
    git
    zsh-vi-mode
)
source $ZSH/oh-my-zsh.sh

export VISUAL='nvim'
export EDITOR='nvim'

### aliases ###

alias py='python3'
alias c='clear'
alias v='nvim'
alias f='DIR=$(du --exclude "*/.*" | awk '\''{print $2}'\'' | sort -u | fzf); [ ! -z "$DIR" ] && cd $DIR'
alias fh='DIR=$(du | awk '\''{print $2}'\'' | sort -u | fzf); [ ! -z "$DIR" ] && cd $DIR'
alias grep='grep --color=auto'
alias htop='htop -U'
alias nap='systemctl hibernate'
alias rm='/bin/safe-rm'
alias ls='ls --color=auto -N --group-directories-first'
alias t='tmux'

alias make_python_venv='python3 -m venv .venv'
alias source_python_venv='source .venv/bin/activate'

export RUST_BACKTRACE=1
export FZF_DEFAULT_OPTS="--no-scrollbar --color 16 --color gutter:-1"

echo '( .-.)'

