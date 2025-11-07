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
          template = "❯ ";
        };
        secondary_prompt = {
          foreground = "green";
          background = "transparent";
          template = "❯❯ ";
        };
        blocks = [
          {
            type = "prompt";
            alignment = "left";
            leading_diamond = "";
            trailing_diamond = "";
            segments = [
              {
                type = "text";
                style = "diamond";
                foreground = "black";
                background = "blue";
                template = ''{{if .Env.IN_NIX_SHELL}} 󱄅 NIXSHELL {{end}}'';
              }
              {
                type = "path";
                style = "diamond";
                foreground = "black";
                background = "white";
                template = " 󰉋 {{.Path}} ";
              }
              {
                type = "git";
                style = "plain";
                foreground = "grey";
                background = "transparent";
                properties = {
                  fetch_status = true;
                  fetch_push_status = true;
                };
              }
            ];
          }

          {
            type = "rprompt";
            overflow = "hidden";
            leading_diamond = "";
            trailing_diamond = "";
            segments = [
              {
                type = "executiontime";
                style = "plain";
                foreground = "grey";
                background = "transparent";
                template = "  {{.FormattedMs}} ";
                properties = {
                  threshold = 5000;
                  style = "austin";
                };
              }
              {
                type = "shell";
                style = "powershell";
                foreground = "black";
                background = "magenta";
                properties.mapped_shell_names = {
                  fish = "FISH";
                  zsh = "ZSH";
                };
                template = "  {{.Name}} ";
              }
              {
                type = "session";
                style = "diamond";
                foreground = "black";
                background = "red";
                template = "  {{.UserName}} ";
              }
              {
                type = "session";
                style = "diamond";
                foreground = "black";
                background = "green";
                template = "  {{.HostName}} ";
              }
            ];
          }

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
