{
  flake.modules.nixos.cli_nix-index = {config, ...}: {
    programs.nix-index = {
      enable = true;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;
    };
  };
}
