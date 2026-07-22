{config, ...}: {
  helix = {
    enable = config.hj.rum.programs.helix.enable;
    input = ./templates/helix.toml;
    output = ".config/helix/themes/matugen.toml";
  };
}
