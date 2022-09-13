import logging
from os.path import expanduser
from re import I
from libqtile.config import Screen
from libqtile import bar, widget, hook
from colors import colors
from screeninfo import get_monitors

theme = "primera"
xx = 15
xf = "UbuntuMono Nerd Font"
pd = 2
group_props = dict(
    fontsize=xx,
    font=xf,
    margin_y=2,
    margin_x=5,
    padding_y=8,
    padding_x=11,
    borderwidth=8,
    center_aligned=True,
    inactive=colors[theme][8],
    active=colors[theme][4],
    highlight_color=colors[theme][2],
    urgent_text=colors[theme][10],
    rounded=True,
    urgent_alert_method="line",
    highlight_method="block",
    this_current_screen_border=colors[theme][2],
    other_current_screen_border=colors[theme][4],
    this_screen_border=colors[theme][3],
    block_highlight_text_color=colors[theme][1],
)


def one_to_five():
    return [str(i) for i in range(1, 6)]


def six_to_ten():
    d = [str(i) for i in range(6, 10)]
    d.append("0")
    return d


primary_box = widget.GroupBox(
    name="primary", visible_groups=six_to_ten(), **group_props
)
secondary_box = widget.GroupBox(
    name="secondary", visible_groups=one_to_five(), **group_props
)
secondary_bar = [
    secondary_box,
    widget.CurrentLayoutIcon(
        scale=0.45,
        custom_icon_paths=[expanduser("~/.config/qtile/icons")],
    ),
    widget.Spacer(),
    widget.Mpris2(
        foreground=colors[theme][4],
        background=colors[theme][1],
        display_metadata=["xesam:title", "xesam:artist"],
        # format="{title}:{artist}",
        font=xf,
        fontsize=xx,
    ),
    widget.Clock(
        foreground=colors[theme][1],
        background=colors[theme][4],
        format=" %a %d %b %Y | %H:%M ",
        font=xf,
        fontsize=12,
    ),
]
primary_bar = [
    primary_box,
    widget.Sep(
        padding=2,
        linewidth=0,
    ),
    widget.CurrentLayoutIcon(
        scale=0.45,
        custom_icon_paths=[expanduser("~/.config/qtile/icons")],
    ),
    widget.WindowName(
        foreground=colors[theme][9],
        background=colors[theme][1],
        format="{name}",
        for_current_screen=True,
        max_chars=30,
        font=xf,
        fontsize=xx,
        timezone="Europe/Berlin",
    ),
    widget.Spacer(),
    widget.Clock(
        foreground=colors[theme][7],
        background=colors[theme][1],
        format="%a %d, %H:%M ",
        font=xf,
        fontsize=xx,
    ),
    widget.Clock(
        foreground=colors[theme][9],
        background=colors[theme][1],
        format="DE:%H:%M ",
        font=xf,
        fontsize=xx,
        timezone="Europe/Berlin",
    ),
    widget.Spacer(),
    widget.Battery(
        fontsize=xx,
        font=xf,
        padding=pd,
        low_percentage=0.25,
        low_background=colors[theme][1],
        low_foreground=colors[theme][5],
        foreground=colors[theme][1],
        background=colors[theme][0],
        charge_char="",
        discharge_char="",
        full_char="",
        hide_threshold=0.98,
        update_interval=1,
        format="{char} {percent:2.0%}",
    ),
    widget.CPU(
        background=colors[theme][3],
        foreground=colors[theme][1],
        format="  {load_percent}%|",
        font=xf,
        fontsize=xx,
    ),
    widget.ThermalSensor(
        background=colors[theme][3],
        foreground=colors[theme][1],
        format="{tag}: {temp:.0f}{unit}",
        tag_sensor="Package id 0",
        threshold=80,
        font=xf,
        fontsize=xx,
    ),
    widget.Memory(
        font=xf,
        fontsize=xx,
        background=colors[theme][4],
        foreground=colors[theme][1],
        measure_mem="G",
        measure_swap="G",
        padding=pd,
        format="  {MemUsed: .2f} GB ",
    ),
    widget.Net(
        foreground=colors[theme][1],
        background=colors[theme][2],
        font=xf,
        fontsize=xx,
        format="  {down} ",
        interface="eno1",
    ),
    widget.PulseVolume(
        mouse_callbacks={},
        background=colors[theme][3],
        foreground=colors[theme][1],
        update_interval=0.01,
        fmt=" 墳 {} ",
        font=xf,
        fontsize=xx,
        padding=pd,
    ),
    widget.Systray(
        icon_size=20,
        padding=4,
    ),
]

screens = [
    Screen(
        top=bar.Bar(
            widgets=primary_bar,
            size=30,
            margin=[7, 3, 0, 5],
            background=colors[theme][1],
            foreground=colors[theme][0],
        ),
    ),
    Screen(
        top=bar.Bar(
            widgets=secondary_bar,
            size=30,
            margin=[5, 5, 0, 5],
            background=colors[theme][1],
            foreground=colors[theme][0],
        ),
    ),
]


@hook.subscribe.screens_reconfigured
def reconfigure_bars():
    if len(get_monitors()) > 1:
        primary_box.visible_groups = six_to_ten()
        secondary_box.visible_groups = one_to_five()
    else:
        primary_box.visible_groups = one_to_five() + six_to_ten()
        primary_box.margin_x = 5
    if hasattr(primary_box, "bar"):
        primary_box.bar.draw()
