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

      shellAliases = {
        c = "clear";
        ll = "eza -l";
        la = "eza -a";
        ff = "fastfetch";
        helix = "hx";
      };

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

    hm = {
      programs.zsh = {
        enable = true;
        zprof.enable = true;

        shellAliases = let
          confDir = "~/nixorcism";
          sudo = "sudo";
        in {
          nrs = "${sudo} nixos-rebuild switch --flake ${confDir}";
          gen = "${sudo} nix-env -p /nix/var/nix/profiles/system --list-generations";
          ngc = "${sudo} nix-collect-garbage -d";
          upd = "nix flake update --flake ${confDir}";
          upg = "${sudo} nixos-rebuild switch --upgrade --flake ${confDir}";
        };

        completionInit = ''
          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
          zstyle ':completion:*' menu no
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        '';

        plugins = [
          {
            name = "fzf-tab";
            inherit (pkgs.zsh-fzf-tab) src;
          }
        ];

        oh-my-zsh = {
          enable = true;
          plugins = [
            "sudo"
            "colored-man-pages"
            "command-not-found"
          ];
        };

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
      };

      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = ["--cmd cd"];
      };

      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      programs.command-not-found = {
        enable = true;
      };
    };
  };
}
