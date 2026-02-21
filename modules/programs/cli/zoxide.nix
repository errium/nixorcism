{
  flake.modules.nixos.cli_zoxide = {config, ...}: {
    hm.programs.zoxide = {
      enable = true;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;

      options = ["--cmd cd"];
    };
  };
}
