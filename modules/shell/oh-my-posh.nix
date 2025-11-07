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
        final_space = false;

        blocks = [
          {
            type = "prompt";
            alignment = "left";
            segments = [
              {
                type = "text";
                style = "plain";
                foreground = "black";
                background = "blue";
                template = ''{{ if .Env.IN_NIX_SHELL }}󱄅 NIXSHELL {{ end }}'';
              }
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
                newline = true;
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
