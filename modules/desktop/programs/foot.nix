{
  flake.modules.nixos.programs'foot = {
    programs.foot = {
      enable = true;
      xdg.serverAutostart = true;
    };

    # TEST: home-manager linking.
    nixorcism.mkImpureConf."foot/foot.ini" = "foot/foot.ini";
  };
}
