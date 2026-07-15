{
  flake.modules.nixos.programs'nix-utils = {
    config,
    pkgs,
    ...
  }: {
    # nh
    programs.nh = {
      enable = true;
      flake = config.nixorcism.confDir;

      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep 3";
      };
    };

    # nix-search-tv
    environment.systemPackages = [
      (pkgs.writeShellApplication {
        name = "nst";
        runtimeInputs = with pkgs; [
          fzf
          nix-search-tv
        ];
        text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
        excludeShellChecks = ["SC2016"];
      })
    ];

    # nix-your-shell
    hj.rum.programs.nix-your-shell = {
      enable = true;

      integrations = {
        fish.enable = config.hj.rum.programs.fish.enable;
        nushell.enable = config.hj.rum.programs.nushell.enable;
        zsh.enable = config.hj.rum.programs.zsh.enable;
      };
    };
  };
}
