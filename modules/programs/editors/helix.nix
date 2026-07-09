{inputs, ...}: {
  flake.modules.nixos.helix = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      (inputs.wrappers.lib.getInstallModule {
        name = "helix";
        value = inputs.wrappers.lib.wrapperModules.helix;
      })
    ];

    wrappers.helix = {
      enable = true;
      runtimePkgs = with pkgs; [
        alejandra
        bash-language-server
        marksman
        nil
        nixd
        nodePackages.prettier
        rust-analyzer
        rustfmt
        shfm
        taplo
      ];
    };

    hj.xdg.config.files."helix/config.toml".source =
      config.impureDir + "/helix/config.toml";

    hj.xdg.config.files."helix/languages.toml".source =
      config.impureDir + "/helix/languages.toml";
  };
}
