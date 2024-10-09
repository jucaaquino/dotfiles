#!/bin/bash

link_file() {
    TARGET="$HOME/$2"
    mkdir -p $(dirname $TARGET)
    ln -sf "$PWD/$1" "$TARGET"
}

link_file zsh/zshrc                 .zshrc
link_file x11/xinitrc               .xinitrc
link_file bspwm/bspwmrc             .config/bspwm/bspwmrc
link_file sxhkd/sxhkdrc             .config/sxhkd/sxhkdrc
link_file alacritty/alacritty.toml  .config/alacritty/alacritty.toml
link_file nvim/init.lua             .config/nvim/init.lua
link_file picom/picom.conf          .config/picom/picom.conf
link_file polybar/config.ini        .config/polybar/config.ini
link_file tmux/tmux.conf            .config/tmux/tmux.conf

