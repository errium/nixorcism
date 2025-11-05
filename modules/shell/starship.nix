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

        character = {
          success_symbol = "[>](bold green)";
          error_symbol = "[>](bold red)";
        };

        format = lib.concatStrings [
          "$username"
          "$directory"
          "$git_branch"
          "$git_status"

          "$fill"

          "$cmd_duration"

          "$line_break"
          "$character"
        ];
      };
    };
  };
}
