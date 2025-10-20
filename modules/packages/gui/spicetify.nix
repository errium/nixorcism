{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  options.nixDots.packages.gui = {
    spicetify.enable = lib.mkEnableOption "Enables spicetify";
  };

  config = lib.mkIf config.nixDots.packages.gui.spicetify.enable {
    imports = [
      inputs.spicetify-nix.homeManagerModules.default
    ];

    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in {
      enable = true;
      wayland = false;

      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "frappe";

      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        betterGenres
        keyboardShortcut
      ];

      enabledSnippets = with spicePkgs.snippets; [
        prettyLyrics
        removePopular
        amogusDancing
        queueTopSidePanel
        hideMadeForYou
      ];

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];
    };
  };
}
