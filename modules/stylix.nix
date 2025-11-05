{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  options.nixorcism.stylix.enable = lib.mkEnableOption "Enable stylix";

  config = lib.mkIf config.nixorcism.stylix.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";
    };

    hm.stylix = {
      enable = true;

      targets = {
        niri.enable = false;
      };
    };
  };
}
