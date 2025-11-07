{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell = {
    starship.enable = lib.mkEnableOption "Enable Starship prompt";
  };

  config = lib.mkIf config.nixorcism.shell.starship.enable {
    hm.programs.starship = {
      enable = true;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
      enableFishIntegration = config.nixorcism.shell.fish.enable;

      enableTransience = true;
      settings = {
      };
    };
  };
}
