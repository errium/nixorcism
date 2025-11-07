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
        transient_prompt = {
          newline = true;
          foreground_templates = [
            "{{if gt .Code 0}}red{{end}}"
            "{{if eq .Code 0}}green{{end}}"
          ];
          background = "transparent";
          template = "> ";
        };

        blocks = [
          # LEFT
          {
            type = "prompt";
            alignment = "left";
            leading_diamond = "";
            trailing_diamond = "";
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
              }
              {
                type = "git";
                style = "powerline";
                foreground = "grey";
                background = "black";
                properties = {
                  fetch_status = true;
                  fetch_push_status = true;
                  fetch_upstream_icon = true;
                };
              }
            ];
          }

          # NEW LINE
          {
            type = "prompt";
            alignment = "left";
            newline = true;
            segments = [
              {
                type = "text";
                style = "plain";
                foreground_templates = [
                  "{{if gt .Code 0}}red{{end}}"
                  "{{if eq .Code 0}}green{{end}}"
                ];
                background = "transparent";
                template = "❯ ";
              }
            ];
          }
        ];
      };
    };
  };
}
