{
  flake.modules.nixos.programs'foot = {config, ...}: {
    hj.rum.programs.foot = {
      enable = true;

      settings = {
        main.include = "~/.config/foot/matugen.ini";

        main = {
          dpi-aware = "no";
          font = "Lilex Nerd Font:size=12";
          initial-color-theme = "dark";
          pad = "4x4 center-when-maximized-and-fullscreen";
        };

        mouse = {
          hide-when-typing = "yes";
        };

        cursor = {
          blink = "yes";
          blink-rate = 1000;
          style = "beam";
        };
      };
    };

    hj.xdg.config.files."foot/matugen.ini".source = "${config.programs.matugen.theme.files}/.config/foot/matugen.ini";
  };
}
