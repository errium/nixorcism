{
  lib,
  pkgs,
  ...
}: {
  flake.modules.nixos.shell_bash = {
    programs.zsh = {
      enable = true;

      autosuggestions = {
        enable = true;
        async = true;
      };

      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
          "pattern"
        ];
        styles = {
          "alias" = "fg=magenta,bold";
        };
        patterns = {
          "rm -rf *" = "fg=red,bold";
        };
      };
    };

    hm.programs.zsh = {
      enable = true;

      history = {
        size = 5000;
        save = 5000;
        share = true;
        append = true;
        ignoreSpace = true;
        ignoreAllDups = true;
        ignoreDups = true;
        saveNoDups = true;
        findNoDups = true;
        expireDuplicatesFirst = true;
      };

      initContent = lib.mkOrder 550 ''
        source ${pkgs.zsh-defer}/share/zsh-defer/zsh-defer.plugin.zsh

        _load_plugins() {
          source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
          source ${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/sudo/sudo.plugin.zsh
          source ${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/bgnotify/bgnotify.plugin.zsh
          unset -f _load_plugins
        }
        zsh-defer _load_plugins
      '';

      completionInit = ''
        autoload -Uz compinit
        zsh-defer compinit

        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      '';
    };

    hm.programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
      command-not-found = {
        enable = true;
      };
    };
  };
}
