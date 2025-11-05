{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell.oh-my-posh.enable = lib.mkEnableOption "Enable Oh My Posh prompt";

  config = lib.mkIf config.nixorcism.shell.oh-my-posh.enable {
    hm.programs.oh-my-posh = {
      enable = true;
      settings = {
      };
    };
  };
}
