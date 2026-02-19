{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.packages.cli.bat = {
    enable = lib.mkEnableOption "bat";
  };

  config = lib.mkIf config.nixorcism.packages.cli.bat.enable {
    hm.programs.bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batgrep
        batman
      ];
    };
  };
}
