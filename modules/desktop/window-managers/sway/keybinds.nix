{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.window-managers.sway.enable {
    hm.wayland.windowManager.sway.config = rec {
      modifier = "Mod4";
      left = "Left";
      down = "Down";
      up = "Up";
      right = "Right";
      terminal = "footclient";
      menu = ''"noctalia-shell ipc call launcher toggle"'';

      keybindings = {
        # Essentials
        "${modifier}+t" = "exec ${terminal}";
        "${modifier}+q" = "kill";
        "${modifier}+space" = "exec ${menu}";
        "${modifier}+e" = "exec nautilus";
        "${modifier}+Shift+m" = "exec swaynag -t warning -m 'Exit sway?' -B 'Yes' 'swaymsg exit'";

        # Navigation
        "${modifier}+${left}" = "focus left";
        "${modifier}+${down}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${right}" = "focus right";

        # Move windows
        "${modifier}+Shift+${left}" = "move left";
        "${modifier}+Shift+${down}" = "move down";
        "${modifier}+Shift+${up}" = "move up";
        "${modifier}+Shift+${right}" = "move right";

        # Resize containers
        "${modifier}+r" = ''mode "resize"'';

        # Workspace navigation
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        # Move containers across workspaces
        "${modifier}+Shift+1" = "move container to workspace number 1; workspace 1";
        "${modifier}+Shift+2" = "move container to workspace number 2; workspace 2";
        "${modifier}+Shift+3" = "move container to workspace number 3; workspace 3";
        "${modifier}+Shift+4" = "move container to workspace number 4; workspace 4";
        "${modifier}+Shift+5" = "move container to workspace number 5; workspace 5";
        "${modifier}+Shift+6" = "move container to workspace number 6; workspace 6";
        "${modifier}+Shift+7" = "move container to workspace number 7; workspace 7";
        "${modifier}+Shift+8" = "move container to workspace number 8; workspace 8";
        "${modifier}+Shift+9" = "move container to workspace number 9; workspace 9";
        "${modifier}+Shift+0" = "move container to workspace number 10; workspace 10";

        # Layouts
        "${modifier}+Control+${right}" = "splith";
        "${modifier}+Control+${down}" = "splitv";
        "${modifier}+Shift+Tab" = "layout stacking";
        "${modifier}+Tab" = "layout tabbed";
        "${modifier}+Shift+e" = "layout toggle split";
        "${modifier}+f" = "fullscreen";
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+Control+space" = "focus mode_toggle";
        "${modifier}+a" = "focus parent";

        # Scratchpad
        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";

      };

      modes = {
        resize = {
          "${left}" = "resize shrink width 10px";
          "${down}" = "resize grow height 10px";
          "${up}" = "resize shrink height 10px";
          "${right}" = "resize grow width 10px";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };
    };
  };
}
