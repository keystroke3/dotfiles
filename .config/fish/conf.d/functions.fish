# personal functions (merged from functions/*.fish)

# Persist cwd for the "resume last dir on new shell" feature (aliases.fish
# startup block). Hooked on fish_prompt + status is-interactive, not on
# `cd` itself, so nested non-interactive fish invocations (spawned by
# nvim's tooling etc.) never see or trigger this. Own file, separate from
# zsh's ~/.zsh/lastdir.
function __save_lastdir --on-event fish_prompt
    status is-interactive; or return
    pwd > ~/.cache/fish/lastdir
end

function bp
    if test -f "$VIRTUAL_ENV/bin/ipython"
        "$VIRTUAL_ENV/bin/ipython" $argv
    else
        /usr/bin/ipython $argv
    end
end

function c
    printf "%s\n" $argv | bc -l
end

function cfg
    set -l fuzz (fs -p ~/dotfiles/ -p ~/dotfiles/.config/ -p ~/.bin/ -i 'node_modules,BraveSoftware,Slack,discord' | fzf --reverse --height 40%)
    if test -f "$fuzz"
        if test -n "$argv[1]"
            $argv[1] "$fuzz"
        else
            nvim "$fuzz"
        end
    else
        return 0
    end
end

function cronhelp
    echo '
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * <command to execute>
'
end

function dbexport
    for i in $apps
        py manage.py dumpdata "$i" > "$i.json"; and echo "exported $i"
    end
end

function dbimport
    for i in $apps
        py manage.py loaddata "$i.json"; and echo "imported $i"
    end
end

function dexec
    set -l fuzz (docker ps --format '{{.Names}}' | fzf --reverse --height 40%)
    test -n "$fuzz"; or return 0
    if test -z "$argv[1]"
        docker exec -it $fuzz bash
    else
        docker exec -it $fuzz $argv
    end
end

function dlogs
    set -l fuzz (docker ps --format '{{.Names}}' | fzf --reverse --height 40%)
    test -n "$fuzz"; or return 0
    docker logs $fuzz -f
end

function fr
    if test -z "$argv[1]"
        echo 'No find string provided'
        return 1
    end
    if test -z "$argv[2]"
        echo 'No replace string provided'
        return 1
    end
    if test -n "$argv[3]"
        sed -i "s/$argv[1]/$argv[2]/g" $argv[3]
    else
        rg "$argv[1]" (pwd) | xargs sed -i "s/$argv[1]/$argv[2]/g"
    end
end

function gch
    if test -n "$argv[1]"
        git checkout $argv
        return 0
    end
    set -l fuzz (git for-each-ref --sort -committerdate --format '%(refname:short)' | grep -v origin | fzf)
    test -z "$fuzz"; and return 0
    git checkout $fuzz
end

function godoc
    go doc $argv[1] | bat --language=go
end

function h
    set -l fuzz (history | sort | uniq | fzf)
    if test -n "$fuzz"
        wl-copy $fuzz
    end
end

function hyprgrep
    hyprctl clients -j | grep -v 'grep' | grep $argv[1] -B 12 -A 11
end

function ignore
    curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$argv" | grep -v 'http' > .gitignore
    echo ".gitignore\n.vscode\n.env" >> .gitignore
end

function j
    set -l fuzz (fs --dir -p $HOME/.config/ -p $HOME -i 'node_modules, __pycahce__,Library,go,.git,venv,.venv' | fzf --reverse --height 40%)
    if test -z "$fuzz"
        return 0
    else if test -d "$fuzz"
        cd "$fuzz"
    end
end

function jl
    set -l git_root (git rev-parse --show-toplevel)
    set -l outer_dir (path dirname -- $git_root)
    if test "$argv[1]" = "/"
        cd "$git_root"
        return 0
    end
    set -l fuzz (~/.bin/fs -d "$git_root" -i 'node_modules,__pycache__' | sed "s|$outer_dir/||" | fzf)
    if test -z "$fuzz"
        return 0
    end
    cd "$outer_dir/$fuzz"
end

function localip
    ip a | grep -E '192.168|10.0' | cut -d ' ' -f6 | cut -d '/' -f1
end

function mkpw
    set -l lenth 8
    test -n "$argv[1]"; and set lenth $argv[1]
    set -l PW (tr -dc 'A-Za-z0-9!$%&*+,-./=?@^_~' </dev/urandom | head -c $lenth)
    echo $PW
end

function o
    set -l fuzz (rg -j 4 --no-ignore --files ~/ ~/.ssh/ ~/.bin /media/videos | fzf --reverse --height 40%)
    if test -f "$fuzz"
        if test -n "$argv[1]"
            $argv[1] "$fuzz"
        else
            mimeo "$fuzz"
        end
    else
        return 0
    end
end

function pc
    test -n "$argv[1]"; and netstat -tulnp | grep $argv[1]
end

function proxyls
    docker container ls --format 'table {{.Names}}' | grep ipvanish
end

function py
    $VIRTUAL_ENV/bin/python $argv
end

function pysum
    set -l clip (wl-paste)
    python -c "print(sum([$clip]))"
end

function pysumf
    set -l clip (wl-paste)
    python -c "print(f'{sum([$clip]):,}')"
end

function remind
    argparse 'd=' 't=' 'n=' -- $argv
    or return 1

    set -l delay
    set -l note

    if set -q _flag_d
        set delay $_flag_d
    end

    if set -q _flag_t
        set -l hour (date --date="$_flag_t" "+%H")
        set -l current_hour (date "+%H")
        set -l current_time (date "+%s")
        if test "$hour" -lt "$current_hour"
            set delay (math (date --date="$_flag_t 1 day" "+%s") - $current_time)
        else
            set delay (math (date --date="$_flag_t" "+%s") - $current_time)
        end
    end

    if set -q _flag_n
        set note $_flag_n
    end

    echo "delay: $delay"
    echo "note: $note"
    begin
        sleep $delay
        and notify-send "$note"
        and mpv --force-window=no /usr/share/sounds/freedesktop/stereo/service-login.oga
    end &> /dev/null &
    disown
end

function secret
    openssl rand -base64 32 | tr '/+=' '_'
end

function sqlf
    set -l fuzz (fs -g '.sql$' | fzf --reverse --height 40%)
    test -f "$fuzz"; or return 0
    sqlformat -ask upper $fuzz -o $fuzz
    sed -i 's/;--/;\n--/g' $fuzz
    sed -i 's/;/;\n\n/g' $fuzz
end

function sstatus
    sudo systemctl status $argv
end

function swap
    mv "$argv[1]" "$argv[1]_"; and mv "$argv[2]" "$argv[1]"; and mv "$argv[1]_" "$argv[2]"
end

function ta
    set -l fuzz (tmux ls | awk -F':' '{print $1}' | fzf)
    test -z "$fuzz"; and return 0
    tmux attach -t $fuzz
end

function tn
    test -z "$argv[1]"; and return 0
    tmux new -s $argv[1]
end

function tpaste
    if test -z "$argv[1]"
        # no-op, mirrors original
    else
        wl-paste --type=TEXT $argv[1]
    end
end

function unepoch
    date -d @$argv[1] "+%F %H:%M:%S"
end

function wgc
    if test "$argv[1]" = "d"
        set -l profile (ip a | grep POINTOPOINT | cut -d':' -f2 | tr -d ' ')
        sudo wg-quick down $profile
        return 0
    end
    set -l profile (ls /etc/wireguard/ --color=never | fzf)
    # NOTE: mirrors original bash bug — `-n profile` tests the literal
    # string "profile" (always true), not the $profile variable.
    if test -n profile
        sudo wg-quick up (echo $profile | cut -d'.' -f1)
    end
end

function ytd
    argparse 'r=' 'a' -- $argv
    or return 1

    if set -q _flag_r
        if not string match -qr '^[0-9]+$' -- $_flag_r
            echo 'Resolution not an integer'
            return 1
        end
    end

    if set -q _flag_a
        set -l link $argv
        if test -z "$link[1]"
            echo 'no link provided'
            return 1
        end
        yt-dlp --audio-format mp3 -x $link
        return 0
    end

    set -l link $argv
    set -l r $_flag_r
    if test -z "$r"
        set r 1080
    end
    if test -z "$link[1]"
        echo 'no link provided'
        return 1
    end
    yt-dlp -f "bestvideo[height<=$r]+bestaudio" $link
end
