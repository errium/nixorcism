{
  # NOTE: `theming_wallust` is NOT meant to be imported manually
  flake.modules.nixos.theming_wallust = {
    confDir,
    config,
    ...
  }: let
    # Yes, polarity is being defined by stylix.
    # No, I don't want to change it, I'm tired from all the configuring.
    polarity = config.stylix.polarity or "dark";

    # Yucky wucky absolute paths
    templatePath = "${confDir}/modules/features/theming/wallust/template.yaml";
    resultPath = "${confDir}/modules/features/theming/wallust/palette.yaml";
  in {
    hm.programs.wallust = {
      enable = true;

      settings = {
        backend = "fastresize";
        check_contrast = true;
        fallback_generator = "complementary";
        palette = polarity;

        templates.palette = {
          template = "${templatePath}";
          target = "${resultPath}";
        };
      };
    };
  };
}
