function __autovenv_find
    set -l dir $PWD
    while true
        if test -d "$dir/.venv"
            echo "$dir/.venv"
            return 0
        end
        if test "$dir" = "$HOME" -o "$dir" = "/"
            return 1
        end
        set dir (path dirname $dir)
    end
end

function __autovenv_check --on-variable PWD
    set -l venv_path (__autovenv_find)
    if test -n "$venv_path"
        if test "$VIRTUAL_ENV" = "$venv_path"
            return
        end
        set -q VIRTUAL_ENV; and deactivate
        source "$venv_path/bin/activate.fish"
    else
        set -q VIRTUAL_ENV; and deactivate
    end
end

__autovenv_check
