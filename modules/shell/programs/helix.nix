{
  flake.modules.nixos.programs'helix = {
    config,
    pkgs,
    ...
  }: {
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

    hj.xdg.config.files."helix/config.toml".source =
      config.impureDir + "/helix/config.toml";

    hj.xdg.config.files."helix/languages.toml".source =
      config.impureDir + "/helix/languages.toml";
  };
}
