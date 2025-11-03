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

        # zsh-abbr = let
        #   confDir = "~/nixorcism";
        #   sudo = "sudo";
        # in {
        #   enable = true;
        #   abbreviations = {
        #     nrs = "${sudo} nixos-rebuild switch --flake ${confDir}";
        #     gen = "${sudo} nix-env -p /nix/var/nix/profiles/system --list-generations";
        #     ngc = "${sudo} nix-collect-garbage -d";
        #     upd = "nix flake update --flake ${confDir}";
        #     upg = "${sudo} nixos-rebuild switch --upgrade --flake ${confDir}";
        #   };
        # };

        plugins = [
          {
            name = "zsh-defer";
            inherit (pkgs.zsh-defer) src;
          }
          {
            name = "fzf-tab";
            inherit (pkgs.zsh-fzf-tab) src;
          }
        ];

        initExtra = let
          confDir = "~/nixorcism";
          sudo = "sudo";

          abbreviations = {
            nrs = "${sudo} nixos-rebuild switch --flake ${confDir}";
            gen = "${sudo} nix-env -p /nix/var/nix/profiles/system --list-generations";
            ngc = "${sudo} nix-collect-garbage -d";
            upd = "nix flake update --flake ${confDir}";
            upg = "${sudo} nixos-rebuild switch --upgrade --flake ${confDir}";
          };

          mkAbbrCommands = lib.concatStringsSep "\n" (
            lib.mapAttrsToList (
              name: value: "  abbr --quiet --session ${name}=${lib.escapeShellArg value}"
            )
            abbreviations
          );
        in ''
              typeset -g ZSH_START_TIME=$EPOCHREALTIME

              zsh-defer -t 0 () {
                # Completion
                autoload -Uz compinit
                compinit -C -d "$HOME/.zcompdump"

                # zsh-abbr
                source ${pkgs.zsh-abbr}/share/zsh/zsh-abbr/zsh-abbr.zsh
          ${mkAbbrCommands}
              }

              precmd() {
                if [[ -n $ZSH_START_TIME ]]; then
                  local ms=$(( (EPOCHREALTIME - ZSH_START_TIME) * 1000 ))
                  if (( ms < 50 )); then
                    printf "\033[32m⚡ Blazingly fast!\033[0m %.2fms\n" $ms
                  elif (( ms < 100 )); then
                    printf "\033[33m⚡ Pretty quick.\033[0m %.2fms\n" $ms
                  else
                    printf "\033[31m🐌 Could be faster...\033[0m %.2fms\n" $ms
                  fi
                  unset ZSH_START_TIME
                fi
              }
        '';

        # enableCompletion = true;
        completionInit = ''
          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
          zstyle ':completion:*' menu no
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        '';

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
    };
  };
}
