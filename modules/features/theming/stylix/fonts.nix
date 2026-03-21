{
  flake.modules.nixos.theming_stylix = {pkgs, ...}: let
    fontSets = {
      adwaita = {
        sansSerif = {
          name = "Adwaita Sans";
          package = pkgs.adwaita-fonts;
        };
        serif = {
          name = "Adwaita Sans";
          package = pkgs.adwaita-fonts;
        };
        monospace = {
          name = "AdwaitaMono Nerd Font";
          package = pkgs.nerd-fonts.adwaita-mono;
        };
      };

      fira = {
        sansSerif = {
          name = "Fira Sans";
          package = pkgs.fira;
        };
        serif = {
          name = "Fira Sans";
          package = pkgs.fira;
        };
        monospace = {
          name = "FiraCode Nerd Font";
          package = pkgs.nerd-fonts.fira-code;
        };
      };

      ibm = {
        sansSerif = {
          name = "IBM Plex Sans";
          package = pkgs.ibm-plex;
        };
        serif = {
          name = "IBM Plex Serif";
          package = pkgs.ibm-plex;
        };
        monospace = {
          name = "Lilex Nerd Font";
          package = pkgs.nerd-fonts.lilex;
        };
      };

      dejavu = {
        sansSerif = {
          name = "DejaVu Sans";
          package = pkgs.dejavu_fonts;
        };
        serif = {
          name = "DejaVu Serif";
          package = pkgs.dejavu_fonts;
        };
        monospace = {
          name = "DejaVuSansM Nerd Font";
          package = pkgs.nerd-fonts.dejavu-sans-mono;
        };
      };

      roboto = {
        sansSerif = {
          name = "Roboto";
          package = pkgs.roboto;
        };
        serif = {
          name = "Roboto Slab";
          package = pkgs.roboto-slab;
        };
        monospace = {
          name = "RobotoMono Nerd Font";
          package = pkgs.nerd-fonts.roboto-mono;
        };
      };

      source = {
        sansSerif = {
          name = "Source Sans 3";
          package = pkgs.source-sans;
        };
        serif = {
          name = "Source Serif 4";
          package = pkgs.source-serif;
        };
        monospace = {
          name = "SauceCodePro Nerd Font";
          package = pkgs.nerd-fonts.sauce-code-pro;
        };
      };

      terminus = {
        sansSerif = {
          name = "Unifont";
          package = pkgs.unifont;
        };
        serif = {
          name = "Unifont";
          package = pkgs.unifont;
        };
        monospace = {
          name = "Terminess Nerd Font";
          package = pkgs.nerd-fonts.terminess-ttf;
        };
      };
    };
  in {
    stylix.fonts =
      fontSets.roboto
      // {
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };

        sizes = {
          applications = 10;
          desktop = 10;
          popups = 10;
          terminal = 12;
        };
      };
  };
}
