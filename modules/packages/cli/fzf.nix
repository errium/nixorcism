{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    fzf.enable = lib.mkEnableOption "Enables fzf";
  };

  config = lib.mkIf config.nixorcism.packages.cli.fzf.enable {
    hm.programs.fzf = {
      enable = true;

      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;
    };
  };
}
