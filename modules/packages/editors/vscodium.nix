{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.editors.vscodium = {
    enable = lib.mkEnableOption "VSCodium";
  };

  config = lib.mkIf config.nixorcism.packages.editors.vscodium.enable {
    hm.programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
