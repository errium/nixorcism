{
  flake.modules.nixos.programs'helix = {pkgs, ...}: {
    environment.systemPackages = let
      helixPackages = with pkgs; [
        alejandra
        bash-language-server
        marksman
        nil
        nixd
        prettier
        rust-analyzer
        rustfmt
        shfmt
        taplo
      ];
    in [
      (pkgs.symlinkJoin {
        name = "helix";
        paths = [pkgs.helix];
        nativeBuildInputs = [pkgs.makeWrapper];
        postBuild = ''
          wrapProgram $out/bin/hx --prefix PATH : \
          ${pkgs.lib.makeBinPath helixPackages}
        '';
      })
    ];

    # TEST: home-manager linking.
    nixorcism.mkImpureConf = {
      "helix/config.toml" = "helix/config.toml";
      "helix/languages.toml" = "helix/languages.toml";
    };
  };
}
