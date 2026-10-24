{
  flake.modules.nixos.programs'shell-utils = {
    config,
    pkgs,
    ...
  }: {
    hj.packages = with pkgs; [
      bat
      btop
      dysk
      eza
      fd
      fzf
      ripgrep
      tree
    ];

    # btop
    hj.xdg.config.files."btop/btop.conf".text = ''
      color_theme = "tty"
      rounded_corners = False
      theme_background = False
      update_ms = 200
    '';

    # eza
    nixorcism.shellAliases = {
      la = "eza -a";
      lat = "eza -lahT";
      ll = "eza -lh";
      lla = "eza -lah";
      lt = "eza -lhT";
    };

    # zoxide
    hj.rum.programs.zoxide = {
      enable = true;
      flags = ["--cmd cd"];

      integrations = {
        fish.enable = config.hj.rum.programs.fish.enable;
        nushell.enable = config.hj.rum.programs.nushell.enable;
        zsh.enable = config.hj.rum.programs.zsh.enable;
      };
    };

    nixorcism.preserve.user.directories = [".local/share/zoxide"];
  };
}
