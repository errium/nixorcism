{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    zoxide.enable = lib.mkEnableOption "Enables zoxide";
  };

  config = lib.mkIf config.nixorcism.packages.cli.zoxide.enable {
    hm.programs.zoxide = {
      enable = true;

      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;

      options = ["--cmd cd"];
    };
  };
}
