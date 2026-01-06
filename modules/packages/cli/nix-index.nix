{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.nix-index = {
    enable = lib.mkEnableOption "nix-index";
  };

  config = lib.mkIf config.nixorcism.packages.cli.nix-index.enable {
    programs.nix-index = {
      enable = true;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;
    };
  };
}
