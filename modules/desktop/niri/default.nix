{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];

  options.nixorcism.desktop = {
    niri.enable = lib.mkEnableOption "Enables niri";
  };

  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    nixpkgs.overlays = [inputs.niri.overlays.niri];

    programs.niri = {
      enable = true;
    };
  };
}
