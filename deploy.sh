#!/bin/bash

link_file() {
	TARGET=$(dirname $1)/
	if [[ "$TARGET" == "./" ]] then
		TARGET=""
	fi
	ln -sf $PWD/$1 $HOME/$TARGET
}

link_file .zshrc
link_file .xinitrc
link_file .config/bspwm
link_file .config/sxhkd
link_file .config/alacritty
link_file .config/picom
link_file .config/polybar
link_file .config/tmux
link_file .config/nvim
