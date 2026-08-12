set -g fish_greeting

if status is-interactive
    fish_vi_key_bindings

    set fish_cursor_default block
    set fish_cursor_insert line blink
    set fish_cursor_visual block blink
    set fish_cursor_replace_one underscore blink
end
