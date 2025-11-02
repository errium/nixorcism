{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  options.nixorcism.shell = {
    zsh.enable = lib.mkEnableOption "Enables zsh";
  };

  config = lib.mkIf config.nixorcism.shell.zsh.enable {
    users.users.${username}.shell = pkgs.zsh;

    programs.zsh = {
      enable = true;

      autosuggestions = {
        enable = true;
        async = true;
      };

      syntaxHighlighting = {
        enable = true;
        styles = {
          "alias" = "fg=magenta,bold";
        };
        patterns = {
          "rm -rf *" = "fg=red,bold";
        };
      };
    };

    hm = {
      programs.zsh = {
        enable = true;

        completionInit = ''
          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
          zstyle ':completion:*' menu no
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        '';
      };
    };
  };
}
