{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.nixorcism.shell.userPrompt == "oh-my-posh") {
    hm.programs.oh-my-posh = {
      enable = true;
      enableFishIntegration = config.nixorcism.shell.fish.enable;
      enableZshIntegration = config.nixorcism.shell.zsh.enable;

      settings = {
        version = 3;
        final_space = true;

        blocks = [
          {
            type = "prompt";
            alignment = "left";
            segments = [
              {
                type = "path";
                style = "powerline";
                powerline_symbol = "";
                foreground = "black";
                background = "white";
                properties.style = "folder";
              }
            ];
          }
        ];
      };
    };
  };
}
