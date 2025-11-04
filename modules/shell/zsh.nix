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

      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-completions"
          "zsh-users/zsh-autosuggestions"
          "zdharma-continuum/fast-syntax-highlighting"
          "ohmyzsh/ohmyzsh path:plugins/sudo"
          "ohmyzsh/ohmyzsh path:plugins/command-not-found"
          "Aloxaf/fzf-tab"
          "chitoku-k/fzf-zsh-completions"
        ];
      };

      initContent = ''
      '';
    };

    programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
