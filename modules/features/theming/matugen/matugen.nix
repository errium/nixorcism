{
  # NOTE: `theming_matugen` is NOT meant to be imported manually
  flake.modules.nixos.theming_matugen = {
    confDir,
    inputs,
    pkgs,
    ...
  }: let
    system = pkgs.stdenv.hostPlatform.system;

    # Yucky wucky absolute paths
    templatePath = "${confDir}/modules/features/theming/matugen/template.yaml";
    resultPath = "${confDir}/modules/features/theming/matugen/palette.yaml";
  in {
    hm = {
      home.packages = [inputs.matugen.packages.${system}.default];

      xdg.configFile."matugen/config.toml".text = ''
        [config]
        caching = false
        prefer = "value"

        [templates.base16]
        input_path = "${templatePath}"
        output_path = "${resultPath}"
        type = "SchemeTonalSpot"
      '';
    };
  };
}
