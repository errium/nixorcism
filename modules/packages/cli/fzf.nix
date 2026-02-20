{
  flake.modules.nixos.fzf = {config, ...}: {
    hm.programs.fzf = {
      enable = true;
      # TODO
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;
    };
  };
}
