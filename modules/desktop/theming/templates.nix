{
  flake.modules.nixos.system'theming = {
    programs.matugen.templates = {
      foot = {
        input_path = ./templates/foot.ini;
        output_path = ["~/.config/foot/matugen.ini"];
      };

      helix = {
        input_path = ./templates/helix.toml;
        output_path = ["~/.config/helix/themes/matugen.toml"];
      };

      sway = {
        input_path = ./templates/sway.conf;
        output_path = ["~/.config/sway/matugen.conf"];
      };
    };
  };
}
