# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ted/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ted/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ted/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ted/.fzf/shell/key-bindings.zsh"
