{
  flake.modules.nixos.desktop'matugen = {pkgs, ...}: {
    hm.home.packages = with pkgs; [matugen];

    # TEST: home-manager linking.
    nixorcism.mkImpureConf."matugen/config.toml" = "matugen/config.toml";
  };
}
