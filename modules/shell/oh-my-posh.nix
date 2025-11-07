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
        newline = true;

        blocks = [
          {
            type = "prompt";
            alignment = "left";
            segments = [
              {
                type = "path";
                style = "powerline";
                foreground = "black";
                background = "white";
                leading_diamond = "";
                trailing_diamond = "";
              }
              {
                type = "git";
                style = "powerline";
                foreground = "grey";
                background = "black";
                leading_diamond = "";
                trailing_diamond = "";
                properties = {
                  fetch_status = true;
                  fetch_push_status = true;
                  fetch_upstream_icon = true;
                };
              }
              {
                type = "text";
                style = "plain";
                foreground = "white";
                background = "transparent";
                template = ''{{ if eq .Shell "fish"}}> {{else if eq .Shell "zsh"}}% {{else}}$ {{end}}'';
              }
            ];
          }
        ];
      };
    };
  };
}
