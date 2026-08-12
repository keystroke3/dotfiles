function fish_prompt
    set -l last_status $status

    set -l teal \e\[38\;5\;116m
    set -l maroon \e\[38\;5\;132m
    set -l yellow \e\[38\;5\;180m
    set -l subtext1 \e\[38\;5\;145m
    set -l rosewater \e\[38\;5\;217m
    set -l green \e\[38\;5\;114m
    set -l red \e\[38\;5\;168m
    set -l normal \e\[0m
    set -l bold \e\[1m

    set -l screen_info ""
    if set -q STY
        set screen_info "$subtext1[$STY:$WINDOW] $normal"
    end

    set -l ssh_info ""
    if set -q SSH_CLIENT; or set -q SSH_TTY; or set -q SSH_CONNECTION
        set ssh_info "$rosewater"(whoami)"@"(hostname -s)" "
    end

    set -l cwd (string replace -r "^$HOME" "~" $PWD)
    set cwd (basename $cwd)

    set -l git_info ""
    if git rev-parse --is-inside-work-tree &>/dev/null
        set -l branch (git symbolic-ref --short -q HEAD 2>/dev/null)
        set -l dirty_check (git status --porcelain 2>/dev/null)
        set -l dirty ""
        test -n "$dirty_check"; and set dirty "*"

        if test -n "$branch"
            set git_info "$normal on$bold $maroon $branch$dirty"
        else
            set -l commit_hash (git rev-parse --short HEAD 2>/dev/null)
            set git_info "$normal on$bold $maroon (HEAD @ $commit_hash)$dirty"
        end
    end

    set -l venv_info ""
    if set -q VIRTUAL_ENV
        set -l pyver (python --version 2>&1 | string split ' ')[2]
        set venv_info "$yellow ($pyver "(basename $VIRTUAL_ENV)")"
    end

    set -l time_info ""
    if set -q CMD_DURATION
        set -l secs (math --scale=0 "$CMD_DURATION / 1000")
        if test $secs -ge 3600
            set -l hrs (math --scale=0 "$secs / 3600")
            set -l mins (math --scale=0 "($secs % 3600) / 60")
            set -l s (math --scale=0 "$secs % 60")
            set time_info "$subtext1"took" $hrs"h" $mins"m" $s"s
        else if test $secs -ge 60
            set -l mins (math --scale=0 "$secs / 60")
            set -l s (math --scale=0 "$secs % 60")
            set time_info "$subtext1"took" $mins"m" $s"s
        else if test $secs -ge 5
            set time_info "$subtext1"took" $secs"s
        end
    end

    set -l prompt_color $green
    test $last_status -eq 0; or set prompt_color $red

    echo -n "$screen_info$ssh_info$bold$teal$cwd$git_info$venv_info $time_info"
    echo
    echo -n "$prompt_color🐟 $normal"
end
