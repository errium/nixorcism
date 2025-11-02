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
    programs.zsh.enable = true;
    users.users.${username}.shell = pkgs.zsh;

    hm = {
      programs.zsh = {
        enable = true;
      };
    };
  };
}
