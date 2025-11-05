{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell.starship.enable = lib.mkEnableOption "Enable Starship prompt";

  config = lib.mkIf config.nixorcism.shell.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
      };
    };
  };
}
