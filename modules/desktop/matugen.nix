{
  flake.modules.nixos.desktop'matugen = {
    config,
    pkgs,
    ...
  }: {
    hj.packages = with pkgs; [matugen];

    hj.xdg.config.files."matugen".source =
      config.impureDir + "/matugen";
  };
}
