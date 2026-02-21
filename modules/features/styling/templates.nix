{
  flake.modules.nixos.feature_styling = {config, ...}: let
    cfg = config.programs.matugen.theme.files;
  in {
    programs.matugen.templates = {
      helix = {
        input_path = builtins.path {
          path = ./templates/helix.toml;
          name = "helix-matugen-template";
        };
        output_path = "$HOME/.config/helix/themes/matugen.toml";
      };
    };

    hm.xdg.configFile."helix/themes/matugen.toml".source = "${cfg}/.config/helix/themes/matugen.toml";
  };
}
