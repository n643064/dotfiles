#!/bin/sh

#cp .zshrc $HOME/
#cp .zshrc-ydl $HOME/
cp .bashrc $HOME/
cp .inputrc $HOME/

mkdir -pv .config/kitty
mkdir -pv .config/neofetch

cp kitty.conf $HOME/.config/kitty/
cp colorscheme.conf $HOME/.config/kitty/
cp neofetch.conf $HOME/.config/neofetch/config.conf
