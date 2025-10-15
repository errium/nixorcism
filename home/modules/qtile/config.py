# ┏━┓╺┳╸╻╻  ┏━╸
# ┃┓┃ ┃ ┃┃  ┣╸
# ┗┻┛ ╹ ╹┗━╸┗━╸
# ╻┏┳┓┏━┓┏━┓┏━┓╺┳╸┏━┓
# ┃┃┃┃┣━┛┃ ┃┣┳┛ ┃ ┗━┓
# ╹╹ ╹╹  ┗━┛╹┗╸ ╹ ┗━┛

import os
import subprocess
from subprocess import check_output

import colors
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# ╻ ╻┏━┓┏━┓╻┏━┓┏┓ ╻  ┏━╸┏━┓
# ┃┏┛┣━┫┣┳┛┃┣━┫┣┻┓┃  ┣╸ ┗━┓
# ┗┛ ╹ ╹╹┗╸╹╹ ╹┗━┛┗━╸┗━╸┗━┛

mod = "mod4"
terminal = "kitty"
fileManager = "nemo"
launcher = "rofi -show drun -show-icons"

home = os.path.expanduser('~')
nixDotsDir = os.path.join(home, ".dotfiles")

# ┏━╸╻ ╻┏━┓╺┳╸┏━┓┏┳┓   ┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻┏━┓
# ┃  ┃ ┃┗━┓ ┃ ┃ ┃┃┃┃   ┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫┗━┓
# ┗━╸┗━┛┗━┛ ╹ ┗━┛╹ ╹   ╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹┗━┛

# Bluetooth Widget
def getBtStatus():
    try:
        out = subprocess.check_output(
            ["bluetoothctl", "show"], text=True
        )
        if "Powered: yes" in out:
            return "Bt: on"
        else:
            return "Bt: off"
    except Exception:
        return "Bt: err"

btWidget = widget.GenPollText(
    func=getBtStatus,
    update_interval=5,  # 5 sec
)

# Keyboard Layout Widget
fetchKbLayout = nixDotsDir + '/home/modules/qtile/fetchKbLayout.sh'

class KbWidget(widget.TextBox):
    def update_self(self):
        layout = check_output([fetchKbLayout]).decode().strip()
        self.text = str(layout)
        self.draw()
    
    def __init__(self, **config):
        super().__init__("", **config)
        self.update_self()

kbLayoutWidget = KbWidget()

# ╻┏ ┏━╸╻ ╻┏┓ ╻┏┓╻╺┳┓╻┏┓╻┏━╸┏━┓
# ┣┻┓┣╸ ┗┳┛┣┻┓┃┃┗┫ ┃┃┃┃┗┫┃╺┓┗━┓
# ╹ ╹┗━╸ ╹ ┗━┛╹╹ ╹╺┻┛╹╹ ╹┗━┛┗━┛

keys = [
    # Essentials
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "e", lazy.spawn(fileManager), desc="Launch file manager"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    # Key([mod], "s", lazy.spawncmd(), desc="Prompt widget"),
    Key([mod], "s", lazy.spawn(launcher), desc='Run launcher'),
    Key([mod, "shift"], "c", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "m", lazy.shutdown(), desc="Shutdown Qtile"),

    # Navigation
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod],"space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Resize windows (columns)
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Split & unsplit navigation
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides"),

    # Layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod], "v", lazy.window.toggle_floating(), desc="Toggle floating"),

    # System
    Key([], "Print", lazy.spawn("scrot -s -e 'xclip -selection clipboard -t image/png -i $f'")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")),
    Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    Key(["mod1"], 50, lazy.function(lambda q: q.current_screen.top.widgets[kbIndex].update_self()), desc="Reload kbLayoutWidget"),
]

# ┏━╸┏━┓┏━┓╻ ╻┏━┓┏━┓
# ┃╺┓┣┳┛┃ ┃┃ ┃┣━┛┗━┓
# ┗━┛╹┗╸┗━┛┗━┛╹  ┗━┛

groups = []
groupNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
groupLayouts = ["columns", "columns", "columns", "columns", "columns", "columns", "columns", "columns", "columns"]

# groupLabels = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
# groupLabels = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
groupLabels = ["1", "10", "11", "100", "101", "110", "111", "1000", "1001"]
# groupLabels = ["DEV", "WWW", "SYS", "DOC", "VBOX", "CHAT", "MUS", "VID", "GFX"]

for i in range(len(groupNames)):
    groups.append(
        Group(
            name=groupNames[i],
            layout=groupLayouts[i].lower(),
            label=groupLabels[i],
        )
    )

for i in groups:
    keys.extend([
        # mod + group number = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(), desc=f"Switch to group {i.name}"),

        # mod + shift + group number = switch to & move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
        #    desc=f"Switch to & move focused window to group {i.name}"),

        # mod + shift + group number = move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name), desc="move focused window to group {}".format(i.name)),
    ])

# ┏━╸┏━┓╻  ┏━┓┏━┓┏━┓┏━╸╻ ╻┏━╸┏┳┓┏━╸
# ┃  ┃ ┃┃  ┃ ┃┣┳┛┗━┓┃  ┣━┫┣╸ ┃┃┃┣╸
# ┗━╸┗━┛┗━╸┗━┛╹┗╸┗━┛┗━╸╹ ╹┗━╸╹ ╹┗━╸

colors = colors.Oxocarbon
accentColor1 = colors[13]
accentColor2 = colors[13]

# ╺┳┓┏━╸┏━╸┏━┓╻ ╻╻  ╺┳╸┏━┓   ┏━╸┏━┓┏━┓   ┏━┓╻  ╻     ╻  ┏━┓╻ ╻┏━┓╻ ╻╺┳╸┏━┓
#  ┃┃┣╸ ┣╸ ┣━┫┃ ┃┃   ┃ ┗━┓   ┣╸ ┃ ┃┣┳┛   ┣━┫┃  ┃     ┃  ┣━┫┗┳┛┃ ┃┃ ┃ ┃ ┗━┓
# ╺┻┛┗━╸╹  ╹ ╹┗━┛┗━╸ ╹ ┗━┛   ╹  ┗━┛╹┗╸   ╹ ╹┗━╸┗━╸   ┗━╸╹ ╹ ╹ ┗━┛┗━┛ ╹ ┗━┛

layoutDefaults = {
    "border_width": 3,
    "margin": 4,
    "border_normal": colors[1],
    "border_focus": accentColor1,
    "border_on_single": True
}

# ╻  ┏━┓╻ ╻┏━┓╻ ╻╺┳╸┏━┓
# ┃  ┣━┫┗┳┛┃ ┃┃ ┃ ┃ ┗━┓
# ┗━╸╹ ╹ ╹ ┗━┛┗━┛ ╹ ┗━┛

# Available layouts are:
#   layout.Bsp(),
#   layout.Columns(),
#   layout.Floating(),
#   layout.Matrix(),
#   layout.Max(),
#   layout.MonadTall(),
#   layout.MonadThreeCol(),
#   layout.MonadWide(),
#   layout.Plasma(),
#   layout.RatioTile(),
#   layout.ScreenSplit(),
#   layout.Slice(),
#   layout.Spiral(),
#   layout.Stack(num_stacks=2),
#   layout.Tile(),
#   layout.TreeTab(),
#   layout.VerticalTile(),
#   layout.Zoomy(),

layouts = [
    layout.Columns(
        **layoutDefaults,
    ),
    layout.Max(
        **layoutDefaults,
    ),
]

# ╺┳┓┏━╸┏━╸┏━┓╻ ╻╻  ╺┳╸┏━┓   ┏━╸┏━┓┏━┓   ┏━┓╻  ╻     ╻ ╻╻╺┳┓┏━╸┏━╸╺┳╸┏━┓
#  ┃┃┣╸ ┣╸ ┣━┫┃ ┃┃   ┃ ┗━┓   ┣╸ ┃ ┃┣┳┛   ┣━┫┃  ┃     ┃╻┃┃ ┃┃┃╺┓┣╸  ┃ ┗━┓
# ╺┻┛┗━╸╹  ╹ ╹┗━┛┗━╸ ╹ ┗━┛   ╹  ┗━┛╹┗╸   ╹ ╹┗━╸┗━╸   ┗┻┛╹╺┻┛┗━┛┗━╸ ╹ ┗━┛

widget_defaults = dict(
    font="JetBrainsMono Nerd Font Bold",
    fontsize=16,
    padding=6,
    background = colors[1],
    foreground = colors[5]
)
extension_defaults = widget_defaults.copy()

# ╻ ╻╻╺┳┓┏━╸┏━╸╺┳╸┏━┓
# ┃╻┃┃ ┃┃┃╺┓┣╸  ┃ ┗━┓
# ┗┻┛╹╺┻┛┗━┛┗━╸ ╹ ┗━┛

#    U+E0BC
#    U+E0BD
#    U+E0BE
#    U+E0BF
#    U+E0B8
#    U+E0B9
#    U+E0BA
#    U+E0BB

def barWidgets():
    return [
        widget.Spacer(
            length=8
        ),
        widget.TextBox(
            text = " ",
            foreground = accentColor1,
            padding = 0,
            fontsize = 20
        ),
        widget.Prompt(),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[1],
            background = colors[0]
        ),
        widget.GroupBox(
            background = colors[0],
            padding = 5,
            disable_drag = True,
            highlight_method = 'text',
            highlight_color = colors[0],
            active = colors[5],
            inactive = colors[2],
            this_current_screen_border = accentColor2,
        ),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[0],
            background = colors[1]
        ),
        widget.CurrentLayout(),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[1],
            background = colors[0]
        ),
        widget.WindowName(
            background = colors[0],
            foreground = accentColor1,
            empty_group_string = "···",
            max_chars = 30
        ),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[1],
            background = colors[0]
        ),
        widget.Systray(
            icon_size = 16
        ),
        widget.Spacer(
            length = 6
        ),

        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[0],
            background = colors[1]
        ),
        widget.DF(
            background = colors[0],
            fmt = "Disk: {}",
            format = "{uf}{m}",
            visible_on_warn = False,
        ),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[1],
            background = colors[0]
        ),
        btWidget,
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[0],
            background = colors[1]
        ),
        widget.Battery(
            background = colors[0],
            fmt = "Bat: {}",
            format = '{char}{percent:2.0%}',
            charge_char = "^",
            discharge_char = "v",
            show_short_text = False
        ),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[1],
            background = colors[0]
        ),
        widget.Backlight(
            fmt = "Bklt: {}",
            backlight_name = "nvidia_wmi_ec_backlight",
        ),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[0],
            background = colors[1]
        ),
        widget.PulseVolume(
            background = colors[0],
            fmt = "Vol: {}",
            step = 1,
        ),
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[1],
            background = colors[0]
        ),
        kbLayoutWidget,
        widget.TextBox(
            text = "",
            fontsize = 23,
            padding = 0,
            foreground = colors[0],
            background = colors[1]
        ),
        widget.Spacer(
            background = colors[0],
            length = 6
        ),
        widget.Clock(
            background = colors[0],
            padding = 0,
            format = "%A, "
        ),
        widget.Clock(
            background = colors[0],
            foreground = accentColor2,
            padding = 0,
            format = "%d "
        ),
        widget.Clock(
            background = colors[0],
            padding = 0,
            format = "%B, "
        ),
        widget.Clock(
            background = colors[0],
            foreground = accentColor1,
            padding = 0,
            format = "%H:%M"
        ),
        widget.Spacer(
            background = colors[0],
            length = 8
        ),
    ]

# ┏━┓┏━╸┏━┓┏━╸┏━╸┏┓╻┏━┓
# ┗━┓┃  ┣┳┛┣╸ ┣╸ ┃┗┫┗━┓
# ┗━┛┗━╸╹┗╸┗━╸┗━╸╹ ╹┗━┛

screens = [
    Screen(
        top=bar.Bar(
            barWidgets(),
            32,
            border_width = [0, 0, 3, 0],
            border_color = "#262626",
            margin=[0, 0, 6, 0],
        ),
        # Uncomment this variable if floating, resizing/moving on X11 is laggy
        # x11_drag_polling_rate = 60,
        right=bar.Gap(6),
        left=bar.Gap(6),
        bottom=bar.Gap(6)
    ),
]

# ╻┏┳┓┏━┓┏━┓┏━┓╺┳╸┏━┓┏┓╻╺┳╸   ┏━╸╻ ╻┏┓╻┏━╸╺┳╸╻┏━┓┏┓╻┏━┓
# ┃┃┃┃┣━┛┃ ┃┣┳┛ ┃ ┣━┫┃┗┫ ┃    ┣╸ ┃ ┃┃┗┫┃   ┃ ┃┃ ┃┃┗┫┗━┓
# ╹╹ ╹╹  ┗━┛╹┗╸ ╹ ╹ ╹╹ ╹ ╹    ╹  ┗━┛╹ ╹┗━╸ ╹ ╹┗━┛╹ ╹┗━┛

kbIndex = next((index for index, obj in enumerate(screens[0].top.widgets) if obj == kbLayoutWidget), None)

# ╺┳┓┏━┓┏━┓┏━╸   ┏━╸╻  ┏━┓┏━┓╺┳╸╻┏┓╻┏━╸   ╻  ┏━┓╻ ╻┏━┓╻ ╻╺┳╸┏━┓
#  ┃┃┣┳┛┣━┫┃╺┓   ┣╸ ┃  ┃ ┃┣━┫ ┃ ┃┃┗┫┃╺┓   ┃  ┣━┫┗┳┛┃ ┃┃ ┃ ┃ ┗━┓
# ╺┻┛╹┗╸╹ ╹┗━┛   ╹  ┗━╸┗━┛╹ ╹ ╹ ╹╹ ╹┗━┛   ┗━╸╹ ╹ ╹ ┗━┛┗━┛ ╹ ┗━┛

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# ╻ ╻╻┏┓╻╺┳┓┏━┓╻ ╻   ┏━┓╻ ╻╻  ┏━╸┏━┓
# ┃╻┃┃┃┗┫ ┃┃┃ ┃┃╻┃   ┣┳┛┃ ┃┃  ┣╸ ┗━┓
# ┗┻┛╹╹ ╹╺┻┛┗━┛┗┻┛   ╹┗╸┗━┛┗━╸┗━╸┗━┛

floating_layout = layout.Floating(
    **layoutDefaults,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

# ┏━┓╻ ╻╺┳╸┏━┓┏━┓╺┳╸┏━┓┏━┓╺┳╸
# ┣━┫┃ ┃ ┃ ┃ ┃┗━┓ ┃ ┣━┫┣┳┛ ┃
# ╹ ╹┗━┛ ╹ ┗━┛┗━┛ ╹ ╹ ╹╹┗╸ ╹

@hook.subscribe.startup_once
def autostart():
    subprocess.call([nixDotsDir + '/home/modules/qtile/autostart.sh'])

# ┏┳┓╻┏━┓┏━╸
# ┃┃┃┃┗━┓┃
# ╹ ╹╹┗━┛┗━╸

# dgroups
dgroups_key_binder = None
dgroups_app_rules = []  # type: list

# Focus & behavior
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False

# Window Management Behavior
auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True
auto_minimize = True

# Wayland
# for vt in range(1, 8):
#     keys.append(
#         Key(
#             ["control", "mod1"],
#             f"f{vt}",
#             lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
#             desc=f"Switch to VT{vt}",
#         )
#     )

# wl_input_rules = None
# wl_xcursor_theme = None
# wl_xcursor_size = 24

# WM Name for Java 
wmname = "LG3D"
