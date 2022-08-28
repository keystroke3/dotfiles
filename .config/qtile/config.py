from libqtile import layout, hook
from libqtile.config import Group, Key, Match, ScratchPad, DropDown
from libqtile.command import lazy
from typing import List  # noqa: F401
from screens import screens
import os
import subprocess

# from keys import keys

mod = "mod4"
mod1 = "mod1"
mod2 = "control"
mod3 = "shift"
home = os.path.expanduser("~")


groups = [
    Group("1", label="1"),
    Group("2", label="2"),
    Group("3", label="3"),
    Group("4", label="4"),
    Group("5", label="5"),
    Group("6", label="6"),
    Group("7", label="7"),
    Group("8", label="8"),
    Group(
        "9",
        label="9",
        matches=[
            Match(wm_class=["discord"]),
        ],
    ),
    Group(
        "0",
        label="0",
        matches=[
            Match(wm_class=["Thunderbird"]),
        ],
    ),
]


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


keys = [
    # Most of our keybindings are in sxhkd file - except these
    # SUPER + FUNCTION KEYS
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    # SUPER + SHIFT KEYS
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "x", lazy.shutdown()),
    Key([mod, "shift"], "r", lazy.restart()),
    # QTILE LAYOUT KEYS
    Key([mod], "n", lazy.layout.normalize()),
    # Key([mod], "v", lazy.next_layout()),
    Key([mod], "v", lazy.next_layout()),
    # CHANGE FOCUS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    # RESIZE UP, DOWN, LEFT, RIGHT
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key(
        [mod, "control"],
        "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key(
        [mod, "control"],
        "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key(
        [mod, "control"],
        "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
    Key(
        [mod, "control"],
        "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
    # FLIP LAYOUT FOR BSP
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),
    # MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    # MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),
    # TOGGLE FLOATING LAYOUT
    Key([mod], "s", lazy.window.toggle_floating()),
]


def window_to_previous_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i - 1)


def window_to_next_screen(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen == True:
            qtile.cmd_to_screen(i + 1)


keys.extend(
    [
        # MOVE WINDOW TO NEXT SCREEN
        Key(
            [mod, "shift"],
            "Right",
            lazy.function(window_to_next_screen, switch_screen=True),
        ),
        Key(
            [mod, "shift"],
            "Left",
            lazy.function(window_to_previous_screen, switch_screen=True),
        ),
    ]
)


def go_to_group(name: str):
    def _inner(qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in "12345":
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()

    return _inner


for i in groups:
    keys.extend(
        [
            # CHANGE WORKSPACES
            # Key([mod], i.name, lazy.group[i.name].toscreen()),
            Key([mod], i.name, lazy.function(go_to_group(i.name))),
            Key([mod], "Tab", lazy.group.next_window()),
            Key([mod, "shift"], "Tab", lazy.group.prev_window()),
            Key(["mod1"], "Tab", lazy.group.next_window()),
            Key(["mod1", "shift"], "Tab", lazy.group.prev_window()),
            # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON CURRENT WORKSPACE
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
            # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                lazy.group[i.name].toscreen(),
            ),
        ]
    )


border = dict(
    border_focus="#E06C75",
    border_normal="#E5C07B",
    border_width=2,
)
layouts = [
    layout.Bsp(fair=False, margin=2, shift_windows=False, **border),
    layout.Max(margin=2, **border),
]

floating_layout = layout.Floating(
    **border,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="copyq"),
        Match(wm_class="QjackCtl"),
        Match(wm_class="MEGASync"),
        Match(wm_class="file-roller"),
        Match(wm_class="Arandr"),
        Match(wm_class="Gnome-disks"),
        Match(wm_class="yad-calender"),
        Match(wm_class="Carousel.py"),
        Match(wm_class="bluetooth"),
        Match(wm_class="lxsession-default-apps"),
        Match(wm_class="polybar"),
        Match(wm_class="Network Connections"),
        Match(wm_class="Picture in picture"),
        Match(wm_class="Picture-in-Picture"),
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
reconfigure_screens = True
wmname = "LG3D"


@hook.subscribe.startup_once
def autostart():
    subprocess.Popen([home + "/.config/qtile/scripts/autostart.sh"])


#  subprocess.call([home + "/.cache/redpaper/wallpaper.sh"])
@hook.subscribe.startup
def start_always():
    subprocess.Popen(["xsetroot", "-curser_name", "left_ptr"])
    # subprocess.Popen(['xsetroot', '-curser_name', 'left_ptr'])
