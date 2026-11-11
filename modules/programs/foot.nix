{
  flake.modules.nixos.programs'foot = {config, ...}: {
    hj.rum.programs.foot = {
      enable = true;

      settings = {
        main = {
          dpi-aware = "no";
          font = "${config.nixorcism.theming.fonts.monospace.name}:size=12";
          include = "~/.config/foot/matugen.ini";
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

    nixorcism.theming.templates."foot.ini" = ".config/foot/matugen.ini";
  };
}
