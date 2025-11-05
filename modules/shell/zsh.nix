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

      autosuggestion = {
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
      zprof.enable = true;

      shellAliases = let
        confDir = "~/nixorcism";
        sudo = "sudo";
      in {
        c = "clear";
        ll = "eza -l";
        la = "eza -a";
        ff = "fastfetch";

        nrs = "${sudo} nixos-rebuild switch --flake ${confDir}";
        gen = "${sudo} nix-env -p /nix/var/nix/profiles/system --list-generations";
        ngc = "${sudo} nix-collect-garbage -d";
        upd = "nix flake update --flake ${confDir}";
        upg = "${sudo} nixos-rebuild switch --upgrade --flake ${confDir}";
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

      initContent = lib.mkOrder 550 ''
        source ${pkgs.zsh-defer}/share/zsh-defer/zsh-defer.plugin.zsh

        zsh-defer source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
        zsh-defer source ${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/sudo/sudo.plugin.zsh
      '';
    };

    hm.programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
      zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = ["--cmd cd"];
      };
      command-not-found = {
        enable = true;
      };
    };
  };
}
