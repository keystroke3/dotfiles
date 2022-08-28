import os
from libqtile.config import Screen
from libqtile import layout, bar, widget, hook
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.bar import Bar
from qtile_extras import widget

theme = "frappe"

colours = {
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


xx = 12
xf = "M Plus 1 Code Semi-Bold"
hdmi = [
    widget.GroupBox(
        fontsize=xx,
        margin_y=4,
        margin_x=5,
        padding_y=3,
        padding_x=2,
        borderwidth=8,
        inactive=colours[theme][8],
        active=colours[theme][2],
        rounded=True,
        urgent_alert_method="text",
        urgent_text=colours[theme][10],
        highlight_color=colours[theme][4],
        highlight_method="text",
        this_current_screen_border=colours[theme][3],
        block_highlight_text_color=colours[theme][1],
        visible_groups=["1", "2", "3", "4", "5"],
    ),
    widget.CurrentLayoutIcon(
        scale=0.45,
        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
    ),
    widget.Spacer(),
    widget.Clock(
        foreground=colours[theme][1],
        background=colours[theme][8],
        format=" %a %d %b %Y | %H:%M",
        font=xf,
        fontsize=xx,
        **decor,
    ),
]

default = [
    widget.GroupBox(
        fontsize=xx,
        margin_y=4,
        margin_x=5,
        padding_y=3,
        padding_x=2,
        borderwidth=8,
        inactive=colours[theme][8],
        active=colours[theme][2],
        rounded=True,
        urgent_alert_method="text",
        urgent_text=colours[theme][10],
        highlight_color=colours[theme][4],
        highlight_method="text",
        this_current_screen_border=colours[theme][3],
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
        low_percentage=0.25,
        low_background=colours[theme][7],
        low_foreground=colours[theme][1],
        foreground=colours[theme][1],
        background=colours[theme][7],
        charge_char="↑",
        discharge_char="",
        update_interval=1,
        format="{percent:2.0%}{char}",
        **decor2,
    ),
    widget.TextBox(
        foreground=colours[theme][9],
        text="|",
        font=xf,
    ),
    widget.CPU(
        background=colours[theme][9],
        foreground=colours[theme][1],
        format=" {load_percent}%",
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][4],
        text="|",
        font=xf,
    ),
    widget.Memory(
        font=xf,
        fontsize=xx,
        background=colours[theme][4],
        foreground=colours[theme][1],
        measure_mem="G",
        measure_swap="G",
        format="{MemUsed: .2f} GB",
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][6],
        text="|",
        font=xf,
    ),
    widget.Net(foreground=colours[theme][6], font=xf, fontsize=xx, interface="eno1"),
    widget.TextBox(
        foreground=colours[theme][3],
        text="|",
        font=xf,
    ),
    widget.Volume(
        mouse_callbacks={},
        background=colours[theme][3],
        foreground=colours[theme][1],
        update_interval=0.001,
        format="{} %",
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][8],
        text="|",
        font=xf,
    ),
    widget.Clock(
        foreground=colours[theme][1],
        background=colours[theme][8],
        format=" %a %d %b %Y | %H:%M",
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.TextBox(
        foreground=colours[theme][7],
        text="|",
        font=xf,
    ),
    # widget.CapsNumLockIndicator(
    #     fontsize=xx,
    #     font=xf,
    #     foreground=colours[theme][1],
    #     background=colours[theme][7],
    #     **decor,
    # ),
    widget.Systray(
        icon_size=20,
        padding=4,
    ),
]
if len(os.listdir("/sys/class/power_supply")) == 0:
    default.extend(
        [
            widget.CapsNumLockIndicator(
                fontsize=xx,
                font=xf,
                foreground=colours[theme][1],
                background=colours[theme][7],
                **decor,
            ),
            widget.TextBox(
                foreground=colours[theme][7],
                text="|",
                font=xf,
            ),
        ]
    )
else:
    default.extend(
        [
            # widget.UPowerWidget(
            #     font=xf,
            #     battery_width=27,
            #     battery_height=14,
            #     fontsize=xx,
            #     percentage_low=0.5,
            #     percentage_critical=0.3,
            #     fill_critical="#ff0000",
            #     fill_charge=colours[theme][3],
            #     fill_low=colours[theme][4],
            #     fill_normal=colours[theme][1],
            #     background=colours[theme][7],
            #     border_colour=colours[theme][1],
            #     border_critical_colour=colours[theme][1],
            #     border_charge_colour=colours[theme][1],
            #     text_charging="",
            #     text_discharging="",
            #     text_displaytime="",
            #     margin=10,
            #     **decor1,
            # ),
            # widget.TextBox(
            #     foreground=colours[theme][7],
            #     text="|",
            #     font=xf,
            # ),
        ]
    )

screens = [
    Screen(
        top=bar.Bar(
            default,
            30,
            background=colours[theme][1],
            foreground=colours[theme][0],
        ),
    ),
    Screen(
        top=bar.Bar(
            hdmi,
            30,
            background=colours[theme][1],
            foreground=colours[theme][0],
        ),
    ),
]
