{pkgs, ...}: {
  hm = {
    wayland.windowManager.sway.config = {
      modifier = "Mod4";
      left = "a";
      down = "s";
      up = "w";
      right = "d";

      menu = "${pkgs.rofi}/bin/rofi -show drun --show-icons";
      terminal = "${pkgs.alacritty}/bin/alacritty";
    };
  };
}
