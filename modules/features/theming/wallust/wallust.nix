{
  # NOTE: `theming_wallust` is NOT meant to be imported manually
  flake.modules.nixos.theming_wallust = {confDir, ...}: let
    templatePath = ./template.yaml;
    resultPath = "${confDir}/modules/features/theming/wallust/palette.yaml";
  in {
    hm.programs.wallust = {
      enable = true;

      settings = {
        backend = "wal";
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
