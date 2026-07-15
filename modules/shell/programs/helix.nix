{
  flake.modules.nixos.programs'helix = {
    config,
    lib,
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

    hj.environment.sessionVariables.EDITOR = lib.mkDefault "hx";

    hj.xdg.config.files = {
      "helix/config.toml".source = config.impureDir + "/helix/config.toml";
      "helix/languages.toml".source = config.impureDir + "/helix/languages.toml";
    };
  };
}
