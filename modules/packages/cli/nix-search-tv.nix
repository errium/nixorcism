{
  pkgs,
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    nix-search-tv.enable = lib.mkEnableOption "Enables nix-search-tv";
  };

  config = lib.mkIf config.nixorcism.packages.cli.nix-search-tv.enable {
    hm = {
      home.packages = with pkgs; [
        (pkgs.writeShellApplication {
          name = "nst";
          runtimeInputs = with pkgs; [
            fzf
            (nix-search-tv.overrideAttrs {
              env.GOEXPERIMENT = "jsonv2";
            })
          ];
          text = ''exec "${pkgs.nix-search-tv.src}/nixpkgs.sh" "$@"'';
        })
      ];
    };
  };
}
