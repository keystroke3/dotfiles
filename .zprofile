export PATH="$HOME/bin:$PATH";
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND='fd --hidden --type f . $HOME'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export TERMINAL=/usr/bin/alacritty
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
# add timestamp for each entry
setopt EXTENDED_HISTORY

# export PYTHONPATH="${PYTHONPATH}:/home/ted/.local/bin"

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# if [[ "$(tty)" = "/dev/tty1" ]]; then
#     pgrep bspwm || startx "$HOME/.xinitrc"
# fi
# [[ $- != *i* ]] && return
# for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;
