{
  flake.modules.nixos.shell'starship = {
    hm.programs.starship = {
      enable = true;
      enableTransience = true;
    };

    # TEST: home-manager linking.
    nixorcism.mkImpureConf."starship.toml" = "starship/starship.toml";
  };
}
