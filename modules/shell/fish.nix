{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell = {
    fish.enable = lib.mkEnableOption "Enables fish";
  };

  config = lib.mkIf config.nixorcism.shell.fish.enable {
    programs.fish = {
      enable = true;
    };

    hm.programs.fish = {
      enable = true;
    };

    hm.programs = {
      fzf = {
        enable = true;
        enableFishIntegration = true;
      };
      command-not-found = {
        enable = true;
      };
    };
  };
}
