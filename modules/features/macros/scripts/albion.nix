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
        minDelay = 100;
        maxDelay = 160;
      }
      {
        key = "18:1 18:0"; # E
        minDelay = 200;
        maxDelay = 250;
      }
      {
        key = "19:1 19:0"; # R
        minDelay = 400;
        maxDelay = 550;
      }
    ];
  in {
    imports = [config.flake.modules.nixos.macros_common];
    hm.home.packages = [albion-sc];

    hm.services.xremap.config.keymap = [
      {
        remap.BTN_SIDE.launch = ["albion-sc"];
        application.only = "Albion-Online";
      }
    ];
  };
}
