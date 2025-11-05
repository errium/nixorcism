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
        version = 2;
        final_space = true;
        console_title_template = "{{ .Shell }} in {{ .Folder }}";
        blocks = [
          {
            type = "prompt";
            alignment = "left";
            segments = [
              {
                type = "session";
                style = "diamond";
                foreground = "#ffffff";
                background = "#c386f1";
                leading_diamond = "\ue0b6";
                trailing_diamond = "\ue0b0";
                template = "{{ .UserName }}";
              }
              {
                type = "path";
                style = "powerline";
                powerline_symbol = "\ue0b0";
                foreground = "#ffffff";
                background = "#ff479c";
                template = " \ue5ff {{ .Path }} ";
                properties = {
                  style = "folder";
                };
              }
              {
                type = "git";
                style = "powerline";
                powerline_symbol = "\ue0b0";
                foreground = "#193549";
                background = "#fff94c";
                template = " {{ .UpstreamIcon }}{{ .HEAD }}{{ .BranchStatus }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }} ";
              }
              {
                type = "exit";
                style = "diamond";
                foreground = "#ffffff";
                background = "#2e9599";
                leading_diamond = "\ue0b2";
                trailing_diamond = "\ue0b4";
                template = " {{ if gt .Code 0 }}\uf00d{{ else }}\uf00c{{ end }} ";
              }
            ];
          }
        ];
      };
    };
  };
}
