[[ $(tty) == '/dev/tty1' ]] && startx
TERM=xterm-256color
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
source ~/.config/zsh/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-vim-mode.zsh
source ~/.config/zsh/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/.config/zsh/autoswitch_virtualenv.plugin.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zprofile ] && source ~/.zprofile
[ -f ~/.aliases ] && source ~/.aliases

autoload -U +X compinit && compinit
autoload -Uz url-quote-magic
autoload -Uz bracketed-paste-magic


# ++++ New history commands ++++

# for arrows
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# for vim mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# for emacs mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

eval "$(starship init zsh)"

