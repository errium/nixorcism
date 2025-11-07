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
                type = "shell";
                style = "powerline";
                foreground = "black";
                background = "white";
                trailing_diamond = "";
                properties.mapped_shell_names = {
                  zsh = "ZSH";
                  fish = "FISH";
                };
              }
              {
                type = "path";
                style = "powerline";
                foreground = "white";
                background = "darkGray";
                trailing_diamond = "";
              }
            ];
          }
        ];
      };
    };
  };
}
