{
  # NOTE: `theming_wallust` is NOT meant to be imported manually
  flake.modules.nixos.theming_wallust = {confDir, ...}: let
    # Yucky wucky impure paths
    templatePath = "${confDir}/modules/features/theming/wallust/template.yaml";
    resultPath = "${confDir}/modules/features/theming/wallust/palette.yaml";
  in {
    hm.programs.wallust = {
      enable = true;

      settings = {
        backend = "fastresize";
        check_contrast = true;
        fallback_generator = "complementary";
        palette = "dark";

        templates.palette = {
          template = "${templatePath}";
          target = "${resultPath}";
        };
      };
    };
  };
}
