import os
from libqtile.config import Click, Drag, KeyChord, Key
from libqtile.command import lazy

mod = "mod4"
mod1 = "mod1"
mod2 = "control"
mod3 = "shift"
home = os.path.expanduser("~")


@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


# SHORTCUTS


keys = [
    # misc
    Key(
        [mod],
        "g",
        lazy.spawn(
            "mpv --no-resume-playback --shuffle /home/salvaje/Videos/Music\ Videos"
        ),
    ),
    # Key([mod], "b", lazy.spawn("alacritty /home/salvaje/.conifg/qtile/")),
    Key(
        [mod], "d", lazy.spawn("redpaper -a"), desc="Downloads and sets new wallpapers"
    ),
    Key([mod], "c", lazy.spawn("redpaper -c"), desc="Next wallapaper"),
    Key([mod, "shift"], "c", lazy.spawn("redpaper -b"), desc="Next wallapaper"),
    Key(
        [mod],
        "r",
        lazy.spawn("bash /home/salvaje/.bin/open_in_mpv"),
        desc="Opens a link in the clipboard in mpv",
    ),
    Key([mod], "Return", lazy.spawn("kitty")),
    Key([mod, "shift"], "Return", lazy.spawn("alacritty")),
    Key([mod, "shift"], "Escape", lazy.shutdown()),
    Key(["control"], "q", lazy.spawn("echo 'ignore'")),
    # XF86 Toggle Keys
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),
    # Window Manipulation
    Key([mod], "s", lazy.window.toggle_floating()),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "period", lazy.layout.grow()),
    Key([mod], "comma", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    # Key([mod], "h", lazy.layout.decrease_ratio()),
    # Key([mod], "l", lazy.layout.increase_ratio()),
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "mod1"], "Down", lazy.layout.flip_down()),
    Key([mod, "mod1"], "Up", lazy.layout.flip_up()),
    Key([mod, "mod1"], "Left", lazy.layout.flip_left()),
    Key([mod, "mod1"], "Right", lazy.layout.flip_right()),
    Key([mod, "shift"], "n", lazy.layout.normalize()),
    # Key(
    #     [mod, "shift"],
    #     "h",
    #     lazy.layout.move_left(),
    #     desc="Move up a section in treetab",
    # ),
    # Key(
    #     [mod, "shift"],
    #     "l",
    #     lazy.layout.move_right(),
    #     desc="Move down a section in treetab",
    # ),
    Key([mod], "Tab", lazy.group.next_window()),
    Key([mod, "shift"], "Tab", lazy.group.previous_window()),
    Key([mod], "y", lazy.hide_show_bar()),
    # Key([mod], "a", lazy.next_layout()),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key(
        [mod], "q", lazy.spawn("bash /home/salvaje/.config/rofi/powermenu/powermenu.sh")
    ),
    Key([mod, "shift"], "x", lazy.shutdown()),
    Key([mod], "F5", lazy.reload_config()),
    Key([mod, "shift"], "F5", lazy.restart()),
    Key(["shift"], "Print", lazy.spawn("flameshot gui")),
    Key(
        ["control"],
        "Print",
        lazy.spawn("flameshot screen -r -c -p /Pictures/screenshots"),
    ),
    # APPLICATIONS
    Key(
        [mod],
        "space",
        lazy.spawn("bash /home/salvaje/.config/rofi/launchers/colorful/launcher.sh"),
    ),
    Key([mod], "e", lazy.spawn("caja")),
    Key([mod], "p", lazy.spawn("bash /home/salvaje/.bin/cipicker hex")),
    Key([mod, "shift"], "p", lazy.spawn("bash /home/salvaje/.bin/cipicker hsl")),
    Key([mod, mod1], "p", lazy.spawn("bash /home/salvaje/.bin/cipicker rgb")),
    Key(
        [mod, "shift"],
        "d",
        lazy.spawn(
            "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'"
        ),
    ),
    Key([mod], "v", lazy.next_layout()),
    Key([mod], "m", lazy.spawn("pavucontrol")),
    Key([mod], "u", lazy.spawn("bash /home/salvaje/.bin/yts -D")),
    Key([mod], "b", lazy.spawn("kitty -e nvim /home/salvaje/.config/qtile/config.py")),
    Key(
        [mod, "shift"],
        "b",
        lazy.spawn("kitty -e nvim /home/salvaje/.config/qtile/keys.py"),
    ),
    Key([mod], "question", lazy.spawn("bash /home/salvaje/.bin/spellq")),
    Key([mod], "grave", lazy.spawn("dunstctl history-pop")),
    Key([mod, "shift"], "grave", lazy.spawn("dunstctl close")),
    Key([mod1], "space", lazy.spawn("bash /home/salvaje/.bin/finder")),
    Key(
        [mod, "shift"], "space", lazy.spawn("bash /home/salvaje/.bin/vp-finder resume")
    ),
    Key([mod], "bracketleft", lazy.spawn("copyq menu clipboard")),
    Key([mod, "shift"], "bracketleft", lazy.spawn("copyq show clipboard")),
    Key([mod], "bracketright", lazy.spawn("bash /home/salvaje/.bin/vsc-open")),
    Key([mod1, "control"], "f", lazy.spawn("firefox")),
    # KeyChord(
    #     [mod],
    #     "i",
    #     [
    #         Key([], "f", lazy.spawn("firefox")),
    #         Key([], "v", lazy.spawn("vivaldi-stable")),
    #         Key([], "b", lazy.spawn("brave")),
    #         Key([], "q", lazy.spawn("qutebrowser")),
    #         Key([], "l", lazy.spawn("librewolf")),
    #     ],
    # ),
]


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position(),
        start=lazy.window.get_position(),
    ),
    Drag([mod], "Button3", lazy.window.set_size(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
