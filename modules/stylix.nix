{
  inputs,
  config,
  lib,
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
    };
  };
}
