import os
from libqtile.config import Screen
from libqtile import layout, bar, widget, hook
from qtile_extras.widget.decorations import RectDecoration

theme = "primera"

colours = {
    "primera": [
        ["#36386c"],  # colour 0
        ["#1e1c31"],  # colour 1
        ["#e06c75"],  # colour 2
        ["#e5c07b"],  # colour 3
        ["#98c379"],  # colour 4
        ["#c678dd"],  # colour 5
        ["#61afef"],  # colour 6
        ["#dcdfe4"],  # colour 7
        ["#777777"],  # colour 8
        ["#ffa1a1"],  # colour 9
        ["#ff6e6e"],  # Colour 10
    ],
    "purple": [
        ["#9CA5D6"],  # Colour 0
        ["#20212C"],  # Colour 1
        ["#f07178"],  # Colour 2
        ["#98E886"],  # Colour 3
        ["#FAEF83"],  # Colour 4
        ["#bb80b3"],  # Colour 5
        ["#CF9CF0"],  # Colour 6
        ["#7EA6FA"],  # Colour 7
        ["#BABFE0"],  # Colour 8
        ["#ff8b92"],  # Colour 9
        ["#ff6e6e"],  # Colour 10
    ],
    "palenight": [
        ["#D8DEE9"],  # Colour 0
        ["#282d3e"],  # Colour 1
        ["#ff8b92"],  # Colour 2
        ["#c3e88d"],  # Colour 3
        ["#ffe585"],  # Colour 4
        ["#c792ea"],  # Colour 5
        ["#f5c2e7"],  # Colour 6
        ["#82aaff"],  # Colour 7
        ["#81A1C1"],  # Colour 8
        ["#F2779C"],  # Colour 9
        ["#ff6e6e"],  # Colour 10
    ],
    "frappe": [
        ["#D8DEE9"],  # Colour 0
        ["#303446"],  # Colour 1
        ["#e78284"],  # Colour 2
        ["#a6d189"],  # Colour 3
        ["#e5c890"],  # Colour 4
        ["#ca9ee6"],  # Colour 5
        ["#eebebe"],  # Colour 6
        ["#8caaee"],  # Colour 7
        ["#babbf1"],  # Colour 8
        ["#81c8be"],  # Colour 9
        ["#F2779C"],  # Colour 10
    ],
    "macchiato": [
        ["#D8DEE9"],  # Colour 0
        ["#24273a"],  # Colour 1
        ["#ed8796"],  # Colour 2
        ["#a6da95"],  # Colour 3
        ["#eed49f"],  # Colour 4
        ["#c6a0f6"],  # Colour 5
        ["#f0c6c6"],  # Colour 6
        ["#8aadf4"],  # Colour 7
        ["#b7bdf8"],  # Colour 8
        ["#8bd5ca"],  # Colour 9
        ["#F2779C"],  # Colour 10
    ],
    "mocha": [
        ["#D8DEE9"],  # Colour 0
        ["#1e1e2e"],  # Colour 1
        ["#f38baf"],  # Colour 2
        ["#a6e3a1"],  # Colour 3
        ["#F9E2AF"],  # Colour 4
        ["#CBA6F7"],  # Colour 5
        ["#f2cdcd"],  # Colour 6
        ["#89DCEB"],  # Colour 7
        ["#C9CBFF"],  # Colour 8
        ["#94E2D5"],  # Colour 9
        ["#F2779C"],  # Colour 10
    ],
    "dracula": [
        ["#D8DEE9"],  # Colour 0
        ["#282a36"],  # Colour 1
        ["#ff6e6e"],  # Colour 2
        ["#50fa7b"],  # Colour 3
        ["#f1fa8c"],  # Colour 4
        ["#F2779C"],  # Colour 5
        ["#ff79c6"],  # Colour 6
        ["#8be9fd"],  # Colour 7
        ["#d6acff"],  # Colour 8
        ["#a4ffff"],  # Colour 9
        ["#ff5555"],  # Colour 10
    ],
    "nord": [
        ["#D8DEE9"],  # Colour 0
        ["#2e3440"],  # Colour 1
        ["#BF616A"],  # Colour 2
        ["#A3BE8C"],  # Colour 3
        ["#88C0D0"],  # Colour 4
        ["#d6acff"],  # Colour 5
        ["#B48EAD"],  # Colour 6
        ["#81A1C1"],  # Colour 7
        ["#EBCB8B"],  # Colour 8
        ["#b5e8e0"],  # Colour 9
        ["#E78284"],  # Colour 10
    ],
    "latte": [
        ["#4C4F69"],  # Colour 0
        ["#EFF1F5"],  # Colour 1
        ["#D20F39"],  # Colour 2
        ["#40A02B"],  # Colour 3
        ["#DF8E1D"],  # Colour 4
        ["#8839ef"],  # Colour 5
        ["#EA76CB"],  # Colour 6
        ["#179299"],  # Colour 7
        ["#1E66F5"],  # Colour 8
        ["#e64553"],  # Colour 9
        ["#ff6e6e"],  # Colour 10
    ],
    "one": [
        ["#c8ccd4"],  # Colour 0
        ["#282c34"],  # Colour 1
        ["#e06c75"],  # Colour 2
        ["#98c379"],  # Colour 3
        ["#e5c07b"],  # Colour 4
        ["#c678dd"],  # Colour 5
        ["#f5c2e7"],  # Colour 6
        ["#56b6c2"],  # Colour 7
        ["#61afef"],  # Colour 8
        ["#F2779C"],  # Colour 9
        ["#ff6e6e"],  # Colour 10
    ],
}

rad = 0
decor = {
    "decorations": [
        RectDecoration(
            use_widget_background=True,
            radius=rad,
            filled=True,
            padding_y=3,
        )
    ],
    "padding": 5,
}
decor1 = {
    "decorations": [
        RectDecoration(
            use_widget_background=True,
            radius=[rad, 0, 0, rad],
            filled=True,
            padding_y=3,
        )
    ],
    "padding": 5,
}
decor2 = {
    "decorations": [
        RectDecoration(
            use_widget_background=True,
            radius=[0, rad, rad, 0],
            filled=True,
            padding_y=3,
        )
    ],
    "padding": 5,
}


xx = 14
xf = "UbuntuMono Nerd"
pd = 2
hdmi = [
    widget.GroupBox(
        fontsize=xx,
        margin_y=2,
        margin_x=5,
        padding_y=8,
        padding_x=4,
        borderwidth=8,
        inactive=colours[theme][8],
        active=colours[theme][4],
        highlight_color=colours[theme][2],
        urgent_text=colours[theme][10],
        rounded=False,
        urgent_alert_method="line",
        highlight_method="block",
        this_current_screen_border=colours[theme][2],
        other_current_screen_border=colours[theme][2],
        other_screen_border=colours[theme][3],
        block_highlight_text_color=colours[theme][1],
        visible_groups=["1", "2", "3", "4", "5"],
    ),
    widget.CurrentLayoutIcon(
        scale=0.45,
        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
    ),
    widget.Spacer(),
    widget.Mpris2(
        foreground=colours[theme][4],
        background=colours[theme][1],
        display_metadata=["xesam:title", "xesam:artist"],
        format="{title}:{artist}",
        font=xf,
        fontsize=12,
    ),
    widget.Clock(
        foreground=colours[theme][1],
        background=colours[theme][4],
        format=" %a %d %b %Y | %H:%M ",
        font=xf,
        fontsize=12,
    ),
]
eDP = [
    widget.GroupBox(
        fontsize=xx,
        margin_y=2,
        margin_x=5,
        padding_y=8,
        padding_x=4,
        borderwidth=8,
        inactive=colours[theme][8],
        active=colours[theme][4],
        highlight_color=colours[theme][2],
        urgent_text=colours[theme][10],
        rounded=False,
        urgent_alert_method="line",
        highlight_method="block",
        this_current_screen_border=colours[theme][2],
        other_current_screen_border=colours[theme][2],
        other_screen_border=colours[theme][3],
        block_highlight_text_color=colours[theme][1],
        visible_groups=["6", "7", "8", "9", "0"],
    ),
    widget.Sep(
        padding=2,
        linewidth=0,
    ),
    widget.CurrentLayoutIcon(
        scale=0.45,
        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
    ),
    widget.Spacer(),
    widget.Battery(
        fontsize=xx,
        font=xf,
        padding=pd,
        low_percentage=0.25,
        low_background=colours[theme][7],
        low_foreground=colours[theme][1],
        foreground=colours[theme][1],
        background=colours[theme][7],
        charge_char="↑",
        discharge_char="",
        update_interval=1,
        format=" {percent:2.0%}{char} ",
        # **decor2,
    ),
    widget.CPU(
        background=colours[theme][3],
        foreground=colours[theme][1],
        format="  {load_percent}% ",
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.Memory(
        font=xf,
        fontsize=xx,
        background=colours[theme][4],
        foreground=colours[theme][1],
        measure_mem="G",
        measure_swap="G",
        padding=pd,
        format="  {MemUsed: .2f} GB ",
        # # **decor,
    ),
    widget.Net(
        foreground=colours[theme][1],
        background=colours[theme][2],
        font=xf,
        fontsize=xx,
        format=" ↓ {down} ",
        interface="eno1",
    ),
    widget.Volume(
        mouse_callbacks={},
        background=colours[theme][3],
        foreground=colours[theme][1],
        update_interval=0.001,
        format="  {} % ",
        font=xf,
        fontsize=xx,
        padding=pd,
        # **decor,
    ),
    widget.Clock(
        foreground=colours[theme][1],
        background=colours[theme][6],
        format="  %a %d,| %H:%M ",
        font=xf,
        fontsize=xx,
        # # **decor,
    ),
    widget.Systray(
        icon_size=20,
        padding=4,
    ),
]

screens = [
    Screen(
        top=bar.Bar(
            widgets=eDP,
            size=30,
            margin=[7, 3, 0, 5],
            background=colours[theme][1],
            foreground=colours[theme][0],
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets=hdmi,
            size=30,
            margin=[5, 5, 0, 5],
            background=colours[theme][1],
            foreground=colours[theme][0],
        ),
    ),
]


@hook.subscribe.screens_reconfigured
async def _():
    if len(qtile.screens) > 1:
        eDP.visible_groups = ["6", "7", "8", "9", "0"]
    else:
        eDP.visible_groups = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    if hasattr(eDP, "bar"):
        eDP.bar.draw()
