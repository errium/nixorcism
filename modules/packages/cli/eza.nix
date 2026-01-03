{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.eza = {
    enable = lib.mkEnableOption "Whether to enable eza";
  };

  config = lib.mkIf config.nixorcism.packages.cli.eza.enable {
    hm.programs.eza = {
      enable = true;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;

      colors = "auto";
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
  };
}
