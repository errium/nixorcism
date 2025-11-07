{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.shell = {
    ohMyPosh.enable = lib.mkEnableOption "Enables oh-my-posh";
  };

  config = lib.mkIf config.nixorcism.shell.ohMyPosh.enable {
    hm.programs.oh-my-posh = {
      enable = true;
      enableFishIntegration = config.nixorcism.shell.fish.enable;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;
    };

    environment.systemPackages = with pkgs; [
      oh-my-posh
    ];
  };
}
