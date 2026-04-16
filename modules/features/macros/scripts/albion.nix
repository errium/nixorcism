{config, ...}: {
  flake.modules.nixos.macros_albion = {
    pkgs,
    lib,
    ...
  }: let
    mkMacro = config.flake.lib.mkMacro {inherit pkgs lib;};

    albion-sc = mkMacro "albion-sc" [
      {
        key = "2:1 2:0"; # 1
        minDelay = 150;
        maxDelay = 250;
      }
      {
        key = "18:1 18:0"; # E
        minDelay = 150;
        maxDelay = 300;
      }
      {
        key = "19:1 19:0"; # R
        minDelay = 150;
        maxDelay = 300;
      }
      {
        key = "16:1 16:0"; # Q
        clickWithDelay = 50;
        minDelay = 150;
        maxDelay = 250;
      }
      {
        key = "17:1 17:0"; # W
        clickWithDelay = 50;
      }
    ];
  in {
    imports = [config.flake.modules.nixos.macros_common];
    hm.home.packages = [albion-sc];
  };
}
