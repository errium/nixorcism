{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases =
      let
        nixDotsDir = "~/.dotfiles";
      in
      {
        c = "clear";
        ll = "eza -l";
        la = "eza -a";
        ff = "fastfetch";
        helix = "hx";
        sudo = "doas";

        nrs = "doas nixos-rebuild switch --flake ${nixDotsDir}";
        gen = "doas nix-env -p /nix/var/nix/profiles/system --list-generations";
        ngc = "doas nix-collect-garbage -d";
        upd = "nix flake update --flake ${nixDotsDir}";
        upg = "doas nixos-rebuild switch --upgrade --flake ${nixDotsDir}";
        ndiff = "nvd diff /run/current-system ./result";
      };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      styles = {
        "alias" = "fg=magenta";
      };
    };

    plugins = [
      {
        name = "fzf-tab";
        inherit (pkgs.zsh-fzf-tab) src;
      }
    ];

    completionInit = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
    '';

    history = {
      size = 2000;
      save = 2000;
      share = true;
      append = true;
      ignoreSpace = true;
      ignoreDups = true;
      saveNoDups = true;
      findNoDups = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
