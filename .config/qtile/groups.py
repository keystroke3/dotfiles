import os
from libqtile import layout
from libqtile.config import Group, Key, Match, ScratchPad, DropDown
from libqtile.command import lazy
from keys import keys

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
for i in groups:
    keys.extend(
        [
            # CHANGE WORKSPACES
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            Key([mod], "Tab", lazy.screen.next_group()),
            Key([mod, "shift"], "Tab", lazy.screen.prev_group()),
            Key(["mod1"], "Tab", lazy.screen.next_group()),
            Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),
            # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
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
