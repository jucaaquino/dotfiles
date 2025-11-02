export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="essembeh"

export PATH="$HOME/bin:$PATH"
plugins=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
unsetopt extended_history
unsetopt share_history

export VISUAL='nvim'
export EDITOR='nvim'
export BROWSER='firefox'
export RUST_BACKTRACE=1

export FZF_DEFAULT_OPTS="--no-scrollbar --color 16 --color gutter:-1 --list-border sharp --preview-border sharp"

# aliases

alias vim='nvim'
alias grep='grep --color=auto'
alias nap='systemctl hibernate'
alias rm='trash'
alias rss='newsboat'
alias stow='stow --ignore="\.DS_Store"'

if [[ "$(uname -s)" == "Darwin" ]]; then
    alias tsp='ts'
fi
