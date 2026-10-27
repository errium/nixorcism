{
  flake.modules.nixos.programs'spicetify = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [inputs.spicetify-nix.nixosModules.spicetify];

    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in {
      enable = true;
      wayland = null;

      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        keyboardShortcut
      ];

      enabledSnippets = with spicePkgs.snippets; [
        dancingHamster
        hideMadeForYou
        hideSidebarScrollbar
        queueTopSidePanel
        removeGradient
        removePopular
      ];

      enabledCustomApps = with spicePkgs.apps; [
        marketplace
      ];
    };
  };
}
