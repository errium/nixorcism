{
  flake.modules.nixos.cli_eza = {config, ...}: {
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
