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
        "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
        final_space = true;
        version = 3;
        blocks = [
          {
            type = "prompt";
            alignment = "left";
            segments = [
              {
                type = "path";
                style = "powerline";
                powerline_symbol = "\uE0B0";
                foreground = "#ffffff";
                background = "#61AFEF";
                properties = {
                  style = "folder";
                };
              }
            ];
          }
        ];
      };
    };
  };
}
