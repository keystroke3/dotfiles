#!/bin/sh
# sudo pacman -S yay

# yay -S --needed autorandar nemo code deezloader-remix-git \
# glu kitty tauon-music-box pcmanfm polybar powerline ranger \
# python-pip persepolis findutils telegram-desktop xfce4-screenshooter \
# xfce4-power-manager xflux

cd ~/dotfiles
dots=$HOME/dotfiles/*
alldots=`ls -a`
for i in $dots
do
    echo $i
done