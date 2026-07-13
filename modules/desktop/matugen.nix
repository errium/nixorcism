{
  flake.modules.nixos.desktop'matugen = {
    config,
    pkgs,
    ...
  }: {
    userPackages = with pkgs; [matugen];

    hj.xdg.config.files."matugen/".source =
      config.impureDir + "/matugen/";
  };
}
