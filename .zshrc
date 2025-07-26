export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="essembeh"

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

export PATH="$HOME/.local/bin:$PATH"

plugins=(
    git
    zsh-vi-mode
)
source $ZSH/oh-my-zsh.sh

export VISUAL='nvim'
export EDITOR='nvim'
export BROWSER='firefox'
export PYTHONPATH='/home/juca/code/vectorpark'

### aliases ###

alias py='python3'
alias v='nvim'
alias grep='grep --color=auto'
alias nap='systemctl hibernate'
alias rm='echo :P'
#alias ls='ls -X --group-directories-first --color=auto'
alias gv='glslViewer'
alias htop='htop -U'

alias bat='echo "Battery: $(cat /sys/class/power_supply/BAT0/capacity)%"'
alias t='tmux-sessionizer'

export RUST_BACKTRACE=1
export FZF_DEFAULT_OPTS="--no-scrollbar --color 16 --color gutter:-1"

EMOJI="(^-^*)
(^_^)b
\\(o_o)/
(˚Δ˚)b
(>_<)
\\(^Д^)/
(·.·)
(·_·)
(;-;)
(='X'=)
(≥o≤)
(o^^)o"

neofetch
