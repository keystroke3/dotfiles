# eval "$(starship init zsh)"
ZDIR=$HOME/.config/zsh/
source $ZDIR/prompt
source $ZDIR/aliases
HISTFILE=$ZDIR/zhistory
HISTSIZE=20000
SAVEHIST=15000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt autocd extendedglob
bindkey -v
autoload -Uz compinit
compinit
source $ZDIR/syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDIR/autosuggestions.zsh
source $ZDIR/autoswitch_virtualenv.plugin.zsh
export GOPATH=${HOME}/go
export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin
export PATH="$HOME/dev/caddy/cmd/caddy/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="/snap/bin:$PATH"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export GPG_TTY=$(tty)
#LS_COLOR='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
#export LS_COLORa
stty -ixon

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export NODE_PATH="/usr/local/lib/node_modules"
export LOCAL_PH_TOKEN='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAzNjczMjM4LCJpYXQiOjE3MDEwODEyMzgsImp0aSI6ImZjZGQ0M2E5MjhlZjQyMGU5ZDBmNzZmMGZmNjQ2YzFmIiwidXNlcl9pZCI6IjkyOTA4ZTRhIn0.3oaVWquOsRrt1_VOCUSK4tgzfhzyz7Ll0ypPiZnHis4'
export HELLO="hi"
# bindkey "^R" history-incremental-search-backward
zstyle ':autocomplete:*' default-context history-incremental-search-backward
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/ted/.local/share/flatpak/exports/share"
. "$HOME/.cargo/env"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

