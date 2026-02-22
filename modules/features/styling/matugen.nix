{
  flake.modules.nixos.feature_styling = {
    lib,
    pkgs,
    ...
  }: let
    templates = [
      {
        name = "helix";
        input = ./templates/helix.toml;
        output = "~/.config/helix/themes/matugen.toml";
      }
    ];
  in {
    hm = {
      home.packages = with pkgs; [matugen];

      xdg.configFile."matugen/config.toml".text = ''
        [config]
        fallback_color = "#ffbf9b"

        ${lib.concatStringsSep "\n" (map (t: ''
          [templates.${t.name}]
          input_path = '${t.input}'
          output_path = '${t.output}'
          ${lib.optionalString (t ? postHook) "post_hook = '${t.postHook}'"} '')
        templates)}
      '';
    };
  };
}
