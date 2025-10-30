{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      programs.niri.settings.binds = {
        # Essentials
        "Mod+T".action.spawn = "alacritty";
        "Mod+E".action.spawn = "nemo";
        "Mod+S".action.spawn = ["rofi" "-show" "drun" "-show-icons"];
        "Print".action.screenshot = [];
        "Ctrl+Print".action.screenshot-screen = [];
        "Alt+Print".action.screenshot-window = [];
        "Alt+Tab" = {
          action.toggle-overview = {};
          repeat = false;
        };
        "Mod+Q" = {
          action.close-window = {};
          repeat = false;
        };
        "Mod+Shift+Slash".action.show-hotkey-overlay = [];
        "Mod+Shift+M".action.quit = [];

        # Navigation
        "Mod+Left".action.focus-column-left = [];
        "Mod+Down".action.focus-window-or-workspace-down = [];
        "Mod+Up".action.focus-window-or-workspace-up = [];
        "Mod+Right".action.focus-column-right = [];

        # Move column
        "Mod+Shift+Left".action.move-column-left = [];
        "Mod+Shift+Down".action.move-window-down-or-to-workspace-down = [];
        "Mod+Shift+Up".action.move-window-up-or-to-workspace-up = [];
        "Mod+Shift+Right".action.move-column-right = [];

        # Resize column
        "Mod+Ctrl+Left".action.set-column-width = "-10%";
        "Mod+Ctrl+Down".action.set-window-height = "+10%";
        "Mod+Ctrl+Up".action.set-window-height = "-10%";
        "Mod+Ctrl+Right".action.set-column-width = "+10%";
        "Mod+R".action.switch-preset-column-width = [];
        "Mod+Shift+R".action.switch-preset-window-height = [];
        "Mod+Ctrl+R".action.reset-window-height = [];
        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];

        # Column & floating controls
        "Mod+Tab".action.toggle-column-tabbed-display = [];
        "Mod+BracketLeft".action.consume-or-expel-window-left = [];
        "Mod+BracketRight".action.consume-or-expel-window-right = [];
        "Mod+V".action.toggle-window-floating = [];
        "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];
        "Mod+C".action.center-column = [];

        # Workspace navigation
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        # Move column to workspace
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        # Move workspace
        "Mod+Shift+Ctrl+Down".action.move-workspace-down = [];
        "Mod+Shift+Ctrl+Up".action.move-workspace-up = [];

        # Monitor navigation
        "Alt+Left".action.focus-monitor-left = [];
        "Alt+Down".action.focus-monitor-down = [];
        "Alt+Up".action.focus-monitor-up = [];
        "Alt+Right".action.focus-monitor-right = [];

        # Move column to monitor
        "Alt+Shift+Left".action.move-column-to-monitor-left = [];
        "Alt+Shift+Down".action.move-column-to-monitor-down = [];
        "Alt+Shift+Up".action.move-column-to-monitor-up = [];
        "Alt+Shift+Right".action.move-column-to-monitor-up = [];

        # Move workspace to monitor
        "Alt+Shift+Ctrl+Left".action.move-workspace-to-monitor-left = [];
        "Alt+Shift+Ctrl+Down".action.move-workspace-to-monitor-down = [];
        "Alt+Shift+Ctrl+Up".action.move-workspace-to-monitor-up = [];
        "Alt+Shift+Ctrl+Right".action.move-workspace-to-monitor-right = [];

        # System
        "XF86AudioPlay".action.spawn = ["playerctl" "play-pause"];
        "XF86AudioNext".action.spawn = ["playerctl" "next"];
        "XF86AudioPrev".action.spawn = ["playerctl" "previous"];
        "XF86AudioRaiseVolume" = {
          action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"];
          allow-when-locked = true;
        };
        "XF86AudioLowerVolume" = {
          action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
          allow-when-locked = true;
        };
        "XF86AudioMute" = {
          action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
          allow-when-locked = true;
        };
        "XF86AudioMicMute" = {
          action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"];
          allow-when-locked = true;
        };
        "XF86MonBrightnessUp" = {
          action.spawn = ["brightnessctl" "set" "+5%"];
          allow-when-locked = true;
        };
        "XF86MonBrightnessDown" = {
          action.spawn = ["brightnessctl" "set" "5%-"];
          allow-when-locked = true;
        };
        "Mod+Shift+Escape" = {
          action.toggle-keyboard-shortcuts-inhibit = {};
          allow-inhibiting = false;
        };
        "Mod+Shift+P".action.power-off-monitors = {};

        # Mouse binds
        "Mod+Shift+WheelScrollUp".action.focus-column-left = {};
        "Mod+WheelScrollDown" = {
          action.focus-workspace-down = {};
          cooldown-ms = 150;
        };
        "Mod+WheelScrollUp" = {
          action.focus-workspace-up = {};
          cooldown-ms = 150;
        };
        "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
      };
    };
  };
}
