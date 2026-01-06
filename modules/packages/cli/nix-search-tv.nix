{
  pkgs,
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.nix-search-tv = {
    enable = lib.mkEnableOption "nix-search-tv";
  };

  config = lib.mkIf config.nixorcism.packages.cli.nix-search-tv.enable {
    hm.home.packages = with pkgs; [
      (pkgs.writeShellApplication
        {
          name = "nst";
          runtimeInputs = with pkgs; [
            fzf
            nix-search-tv
          ];
          excludeShellChecks = ["SC2016"];
          text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
        })
    ];
  };
}
