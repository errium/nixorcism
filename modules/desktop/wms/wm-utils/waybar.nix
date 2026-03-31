{
  flake.modules.nixos.wm-utils_waybar = {
    hm.programs.waybar = {
      enable = true;

      settings.swayBar = {
        layer = "top";
        position = "bottom";
        height = 22;

        modules-left = ["sway/workspaces" "sway/mode" "sway/window"];
        modules-center = ["custom/left" "clock" "custom/right"];
        modules-right = [
          "custom/left"
          "tray"
          "custom/separator"
          "network"
          "custom/separator"
          "sway/language"
          "pulseaudio"
          "battery"
          "custom/right"
        ];

        "custom/left" = {
          format = "[ ";
        };

        "custom/separator" = {
          format = " / ";
        };

        "custom/right" = {
          format = " ]";
        };

        "sway/workspaces" = {
          format = "{index}";
          on-click = "activate";
          sort-by-number = true;
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
          };
        };

        "sway/mode" = {
          format = "  {}";
          max-length = 50;
        };

        "sway/window" = {
          format = "{}";
          max-length = 150;
        };

        "clock" = {
          format = "{:%H:%M %a, %b %d}";
        };

        "tray" = {
          icon-size = 16;
          spacing = 10;
          show-passive-items = true;
        };

        "network" = {
          format = "󰤩  Connected";
          format-disconnected = "󰤭  Disconnected";
          format-ethernet = "󰈀  Ethernet";
          format-wifi = "󰤨  {essid}";
        };

        "sway/language" = {
          format = "{}";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        };

        "pulseaudio" = {
          max-volume = 150;
          scroll-step = 5;
          format = "{icon}  {volume}%";
          format-muted = "󰝟  Mute";
          format-icons = {
            default = ["󰕾"];
          };
        };

        "battery" = {
          format = "{icon}  {capacity}%";
          format-full = "  {capacity}%";
          format-good = "{icon}  {capacity}%";
          format-icons = ["" "" "" "" ""];
          states = {
            full = 100;
            good = 90;
            normal = 60;
            warning = 20;
            critical = 10;
          };
        };
      };
    };
  };
}
