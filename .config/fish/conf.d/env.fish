# mirrors PATH/env exports from .config/zsh/.zshrc

set -gx GOPATH $HOME/go
fish_add_path -g /usr/local/go/bin
fish_add_path -g $GOPATH/bin
fish_add_path -g $HOME/dev/caddy/cmd/caddy/
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.bin
fish_add_path -g /snap/bin
fish_add_path -g $HOME/.cargo/bin
fish_add_path -g /Users/ted/.lmstudio/bin

if test (uname) = Darwin
    fish_add_path -g /opt/homebrew/opt/mysql-client/bin
    fish_add_path -g /opt/homebrew/opt/python@3.11/bin
    set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/mysql-client/lib/pkgconfig"
end

set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 40%"
set -gx GPG_TTY (tty)
set -gx NODE_PATH "/usr/local/lib/node_modules"
set -gx LOCAL_PH_TOKEN '***REMOVED-EXPIRED-JWT***'
set -gx XDG_DATA_DIRS "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/ted/.local/share/flatpak/exports/share"
set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/lib"

stty -ixon

# NOTE: NVM not ported — ~/.nvm isn't present on this machine and nvm.sh
# is a bash-only script incompatible with fish. If node version switching
# is wanted in fish, use https://github.com/jorgebucaran/nvm.fish or fnm instead.
