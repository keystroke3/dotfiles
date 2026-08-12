# $BIN: eza binary path detection (mirrors zsh aliases logic)
if command -q brew
    set -g BIN (brew --prefix)/bin
else
    set -g BIN /usr/bin
end

alias vim nvim
alias fzf 'fzf --layout=reverse --height=40%'
alias zz 'vim ~/.config/fish/config.fish'
alias vi vim
alias df 'df -h'
alias free 'free -m'
alias more less
alias update 'paru -Syu'
alias get 'paru -S'
alias search 'paru -Fs'
alias kick 'paru -Rns'
alias mv 'mv -v'
alias wget 'wget -U Mozilla/5.0 -c'
alias s 'speedtest --no-up'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias grep 'grep --color=auto'
alias reload "exec $SHELL -l; clear"
alias al 'vim ~/.config/fish/conf.d/aliases.fish ~/.config/fish/conf.d/functions.fish && clear && reload'
alias wal 'vim ~/.config/fish/conf.d/work_aliases.fish ~/.config/fish/conf.d/work_functions.fish && clear && reload'
alias dd 'dd status=progress'
alias rsync 'rsync -ah --progress'
alias feh 'feh -d --edit -. -B black .'
alias gst 'git status'
alias gconflict 'git diff --name-only --diff-filter=U'
alias start 'sudo systemctl start'
alias stop 'sudo systemctl stop'
alias restart 'sudo systemctl restart'
alias sysenable 'sudo systemctl enable'
alias pyserv 'python -m http.server'
alias crontab 'set -gx VISUAL nvim; crontab'
alias myip "curl -s 'https://api.myip.com' | jq"
alias gomigrate "$HOME/go/bin/migrate"
alias mm '/usr/bin/env python manage.py makemigrations'
alias rs 'set -gx DEBUG True; /usr/bin/env python manage.py runserver 127.0.0.1:8002'
# NOTE: "status" is a reserved word in fish and cannot be used as an
# alias/function name (fish errors: "cannot use reserved keyword as
# function name"). Skipped — no clean translation exists; review by hand
# if this alias is needed (e.g. rename to `sstatus`).
alias ustatus 'systemctl --user status'
alias enable 'sudo systemctl enable'
alias uenable 'systemctl --user enable'
alias ustop 'systemctl --user stop'
alias urestart 'systemctl --user restart'
alias mlock multilockscreen
alias ipy ipython
alias yay paru
alias ls "$BIN/eza"
alias ll "$BIN/eza -lga"
alias la "$BIN/eza -a"
alias dshell 'py manage.py shell'
alias dbshell 'py manage.py dbshell'
alias mpn 'mpv --no-resume-playback'
alias cp 'cp -r'
alias rr "exec $SHELL -l; clear"
alias postjson "curl -H 'Content-Type:application/json' -X POST -s"
alias patchjson "curl -H 'Content-Type:application/json' -X PATCH -s"
alias curljson "curl -H 'Content-Type:application/json' -X -s"
alias utc "date +'%Y-%m-%d %H:%M:%S' -d"
alias hserve 'hugo serve --noHTTPCache --ignoreCache --disableFastRender --port=9000'
alias denv 'less --plain ~/.api_data/local_env'
alias dc 'docker compose'
alias dps 'docker ps'
alias dcu 'docker compose up -d'
alias dcd 'docker compose down'
alias dports 'docker ps --format "table {{.Names}}\t{{.Ports}}"'
alias vdc 'vim docker-compose.yml'
alias dtoken "grep -i 'ACCESS' ~/.api_data/local_env | cut -d'=' -f2 | clip.exe"
alias gr 'go run .'
alias vcfg 'cd ~/.config/nvim/ && vim .'
alias du 'du -h'
alias nv neovide
alias nrs 'npm run serve'
alias rsn 'npm run serve'
alias rns 'npm run serve'
alias wrandr wlr-randr
alias reflect 'sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias suspend 'sudo systemctl suspend'
alias nvc 'nvim --cmd "cd ~/.config/nvim" ~/.config/nvim'
alias jbat 'wl-paste | jq | bat --language=json --decorations=never'
alias stress s-tui
alias qb qutebrowser
alias lg lazygit
alias bw 'flatpak run --command=bw com.bitwarden.desktop'
alias venv 'deactivate && source .venv/bin/activate.fish'
alias code vscodium
alias hx helix
alias olm '~/.bin/opencode-lm'
alias hr 'herdr --remote'
alias hs 'herdr --session'

# restore last saved path (own file, see functions.fish __save_lastdir)
if test -f ~/.cache/fish/lastdir
    builtin cd (cat ~/.cache/fish/lastdir)
else
    echo $HOME > ~/.cache/fish/lastdir
    builtin cd $HOME
end
