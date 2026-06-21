{
  flake.modules.nixos.gui_spicetify = {
    inputs,
    pkgs,
    ...
  }: {
    hm = {
      imports = [inputs.spicetify-nix.homeManagerModules.default];

      programs.spicetify = let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
      in {
        enable = true;
        wayland = null;

        enabledExtensions = with spicePkgs.extensions; [
          adblockify
          betterGenres
          hidePodcasts
          keyboardShortcut
        ];

        enabledSnippets = with spicePkgs.snippets; [
          amogusDancing
          hideMadeForYou
          prettyLyrics
          queueTopSidePanel
          removePopular
        ];

        enabledCustomApps = with spicePkgs.apps; [
          marketplace
          ncsVisualizer
        ];
      };
    };
  };
}
