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
      };
    };
  };
}
