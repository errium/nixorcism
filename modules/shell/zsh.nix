{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  options.nixorcism.shell = {
    zsh.enable = lib.mkEnableOption "Enables zsh";
  };

  config = lib.mkIf config.nixorcism.shell.zsh.enable {
    hm.programs.zsh = {
      enable = true;
      zprof.enable = true;
    };
  };
}
