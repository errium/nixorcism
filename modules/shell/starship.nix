{
  config,
  lib,
  ...
}: {
  options.nixorcism.shell.starship.enable = lib.mkEnableOption "Enable Starship prompt";

  config = lib.mkIf config.nixorcism.shell.starship.enable {
    hm.programs.starship = {
      enable = true;
      settings = {
        # Minimal config - add more as needed
        format = "$all";
        add_newline = false;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}
