{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  options.nixorcism.packages.gui.spicetify = {
    enable = lib.mkEnableOption "Spicetify";
  };

  config = lib.mkIf config.nixorcism.packages.gui.spicetify.enable {
    hm = {
      imports = [
        inputs.spicetify-nix.homeManagerModules.default
      ];

      programs.spicetify = let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
      in {
        enable = true;
        wayland = null;

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
  };
}
