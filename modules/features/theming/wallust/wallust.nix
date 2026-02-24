{
  flake.modules.nixos.theming_dynamic = {confDir, ...}: let
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
