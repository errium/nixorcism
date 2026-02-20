{
  inputs,
  pkgs,
  ...
}: {
  flake.modules.nixos.spicetify = {
    hm = {
      imports = [inputs.spicetify-nix.homeManagerModules.default];

      programs.spicetify = let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
      in {
        enable = true;
        wayland = null;

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
