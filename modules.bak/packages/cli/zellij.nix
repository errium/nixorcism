{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.zellij = {
    enable = lib.mkEnableOption "Whether to enable zellij";
  };

  config = lib.mkIf config.nixorcism.packages.cli.zellij.enable {
    hm.programs.zellij = {
      enable = true;
    };
  };
}
