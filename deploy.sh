#!/bin/bash

deploy_file() {
	TARGET=$(dirname $1)/
	if [[ "$TARGET" == "./" ]] then
		TARGET=""
	fi
	ln -sf $PWD/$1 $HOME/$TARGET
}

deploy_file .config/alacritty
deploy_file .config/bspwm
deploy_file .config/nvim
deploy_file .config/picom
deploy_file .config/polybar
deploy_file .config/sxhkd
deploy_file .config/tmux
deploy_file .gitconfig
deploy_file .xinitrc
deploy_file .zshrc
deploy_file .zprofile
