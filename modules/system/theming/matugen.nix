{inputs, ...}: {
  flake.modules.nixos.system'theming = {
    config,
    pkgs,
    ...
  }: {
    imports = [inputs.matugen.nixosModules.default];

    programs.matugen = {
      enable = true;
      package = pkgs.matugen;
      # jsonFormat = "hex";
      type = "scheme-tonal-spot";
      variant = "dark";

      templates = {
        helix = {
          input_path = "${./templates/helix.toml}";
          output_path = "~/.config/helix/themes/matugen.toml";
        };
      };
    };

    hj.xdg.config.files."helix/themes/matugen.toml".source = "${config.programs.matugen.theme.files}/.config/helix/themes/matugen.toml";
  };
}
