set -g fish_greeting

if status is-interactive
    fish_vi_key_bindings

    set fish_cursor_default block
    set fish_cursor_insert line blink
    set fish_cursor_visual block blink
    set fish_cursor_replace_one underscore blink
end
set -x LM_STUDIO_BASE_URL 'http://127.0.0.1:7100'
fish_add_path /opt/homebrew/opt/postgresql@18/bin
