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
    programs.zsh.enable = true;
    users.users.${username}.shell = pkgs.zsh;

    hm.programs.zsh = {
      enable = true;
      enableCompletion = false; # To load manually
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

      # antidote = {
      #   enable = true;
      #   plugins = [
      #     "zsh-users/zsh-completions"
      #     "zsh-users/zsh-autosuggestions"
      #     "zdharma-continuum/fast-syntax-highlighting"
      #     "romkatv/zsh-defer"
      #     "ohmyzsh/ohmyzsh path:plugins/sudo"
      #     "ohmyzsh/ohmyzsh path:plugins/command-not-found"
      #     "Aloxaf/fzf-tab"
      #   ];
      # };

      # initContent = ''
      #   zsh-defer -t 0.5 'autoload compinit -U && compinit'
      # '';

      initContent = ''
        source ${pkgs.zsh-defer}/share/zsh-defer/zsh-defer.zsh

        zsh-defer autoload -Uz compinit && compinit

        zsh-defer zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zsh-defer zstyle ':completion:*' menu no
        zsh-defer zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

        zsh-defer source ${pkgs.zsh-completions}/share/zsh-completions/zsh-completions.zsh
        zsh-defer source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        zsh-defer source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        zsh-defer source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

        zsh-defer source ${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/sudo/sudo.plugin.zsh
        zsh-defer source ${pkgs.oh-my-zsh}/share/oh-my-zsh/plugins/command-not-found/command-not-found.zsh
      '';
    };

    hm.programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
