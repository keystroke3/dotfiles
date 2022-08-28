import os
from libqtile.config import Screen 
from libqtile import layout, bar, widget, hook
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration
from qtile_extras.bar import Bar

colours =  [
    ["#00000000"],      # Colour 0
    ["#2e3440"],        # Colour 1
    ["#ff8b92"],        # Colour 2
    ["#c3e88d"],        # Colour 3
    ["#ffe585"],        # Colour 4
    ["#c792ea"],        # Colour 5
    ["#f5c2e7"],        # Colour 6
    ["#82aaff"],        # Colour 7
    ["#F2779C"],        # Colour 8
    ["#89ddff"],        # Colour 9
    ["#ff6e6e"]]        # Colour 10

decor = {
    "decorations": [
        RectDecoration(use_widget_background=True, radius=13, filled=True, padding_y=0,)
    ],
    "padding": 10,
}

decor2 = decor.copy()
decor2["padding"] = 3

xx=16
xf="ubuntumono nerd font bold"
default=[
    widget.GroupBox(
        font=xf,
        fontsize=26,
        background="#292d3e99",
        margin_y=4,
        margin_x=5,
        padding_y=9,
        padding_x=5,
        borderwidth=7,
        inactive=colours[7],
        active=colours[6],
        rounded=True,
        highlight_color=colours[4],
        highlight_method="text",
        this_current_screen_border=colours[3],
        block_highlight_text_color=colours[1],
        **decor,
    ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
    widget.CurrentLayoutIcon(
        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
        scale=0.4,
        background="#292d3e99",
        **decor2,
    ),

    widget.Spacer(),

    widget.Systray(
        background=colours[0],
        foreground=colours[4],
        icon_size=20,
        padding=4,
    ),
    # widget.Sep(
    #     padding=8,
    #     linewidth=0,
    # ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
    widget.CPU(
        background=colours[9],
        foreground=colours[1],
        format='  {load_percent}%',
        font=xf,
        fontsize=xx,
        **decor,
        ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
    widget.Memory(
        background=colours[4],
        font=xf,
        fontsize=xx,
        foreground=colours[1],
        measure_mem='G',
        measure_swap='G',
        format=' {MemUsed: .2f} GB',
        **decor,
    ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
    widget.Memory(
        measure_mem='G',
        background=colours[6],
        font=xf,
        fontsize=xx,
        foreground=colours[1],
        measure_swap='G',
        format=' {SwapUsed: .2f} GB',
        **decor,
    ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
    widget.PulseVolume(
        mouse_callbacks={'Button3': lambda: qtile.cmd_spawn("pavucontrol")},
        foreground=colours[1],
        update_interval=0.001,
        font=xf,
        fontsize=xx,
        background=colours[3],
        **decor
    ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
    widget.Clock(
        background=colours[2],
        foreground=colours[1],
        format='  %d %b, %a',
        font=xf,
        fontsize=xx,
        **decor,
    ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
    widget.Clock(
        foreground=colours[1],
        background=colours[5],
        font=xf,
        fontsize=xx,
        format='  %I:%M %p',
        **decor,
    ),
    widget.Sep(
        padding=8,
        linewidth=0,
    ),
]
if len(os.listdir("/sys/class/power_supply"))==0:
    default.append(
        widget.CapsNumLockIndicator(
            fontsize=xx,
            font=xf,
            foreground=colours[1],
            background=colours[7],
            **decor,
        )
    )
else:
    default.append(
        widget.Battery(
            fontsize=xx,
            font=xf,
            foreground=colours[1],
            low_percentage=0.3,
            low_background=colours[10],
            background=colours[7],
            low_foreground=colours[1],
            update_interval=1,
            charge_char='',
            discharge_char=' ',
            format='{char}  {percent:2.0%}',
            **decor,
        ),
    )

screens = [
    Screen(
    top=bar.Bar(
        default,
        34,
        background=colours[0],
        foreground=colours[1],
        opacity=1,
        margin=[8,6,4,6],
    ),
    ),
]
