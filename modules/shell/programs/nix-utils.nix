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
    userPackages = [
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
  };
}
