#!/bin/sh
sudo pacman -S yay

HASHES='\n#########################################################################\n\n'

shopt -s dotglob
dots=$HOME/dotfiles/*

echo "installing programs..."
yay -S --needed - < installed.txt
printf "DONE"
printf "$HASHES"
printf "Restoring system and program settings..."
ln -sf $dots/yay $HOME/.config
for i in $dots; do
    if [[ $i == !(*/.git*) ]]; then
        if [[ $i == */.* ]] ; then
            ln -sf $i $HOME
        elif [[ -d $i ]] && [[ $i == !(*/.*) ]]; then
            ln -sf $i $HOME/.config
        fi
    fi
done

echo "dotfiles have been set up"
printf "$HASHES"

# 


