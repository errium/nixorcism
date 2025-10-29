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
        "Alt+Tab".action.toggle-overview = [];
        "Mod+Q".action.close-window = [];
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
      };
    };
  };
}
