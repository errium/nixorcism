{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.nixorcism.shell.userPrompt == "starship") {
    hm.programs.starship = {
      enable = true;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;

      enableTransience = true;
    };
  };
}
