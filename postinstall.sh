#!/bin/sh
git clone git@github.com:keystroke3/dotfiles.git
sudo pacman -S yay

HASHES='\n#########################################################################\n\n'

shopt -s dotglob
dots=$HOME/dotfiles/*

printf "DONE"
printf "$HASHES"
printf "Restoring system and program settings..."

ln -sf $dots/yay $HOME/.config
echo "installing programs..."
yay -S --needed - < installed.txt

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
echo "installing Redpaper ..."

cd $HOME
git clone git@github.com:keystroke3/redpaper.git
cd redpaper
./install.sh
redpaper -dl 5
redpaper -c
printf "$HASHES"

# 


