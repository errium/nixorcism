{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];

  options.nixDots.desktop = {
    niri.enable = lib.mkEnableOption "Enables niri";
  };

  config = lib.mkIf config.nixDots.desktop.niri.enable {
    nixpkgs.overlays = [inputs.niri.overlays.niri];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    hm = {
      imports = [
        inputs.niri.homeModules.niri
        ./config
      ];
    };
  };
}
