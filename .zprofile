# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
[[ $- != *i* ]] && return
export VISUAL="gvim"

export FZF_DEFAULT_COMMAND='fd --hidden --type f . $HOME'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND='fd --hidden -type d'

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

source ~/.cache/wal/colors-tty.sh
EDITOR=/usr/bin/vim
TERMINAL=/usr/bin/kitty
