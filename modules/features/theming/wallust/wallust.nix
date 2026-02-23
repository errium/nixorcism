{
  flake.modules.nixos.theming_wallust = {
    confDir,
    # pkgs,
    ...
  }: let
    templatePath = "${confDir}/modules/features/styling/wallust/template.yaml";
    palettePath = "${confDir}/modules/features/styling/wallust/palette.yaml";
    # setwp = pkgs.writeShellScriptBin "setwp" ''
    #   WALLPAPER="$1"
    #   if [ -z "$WALLPAPER" ]; then
    #     echo "Usage: setwp <path-to-wallpaper>"
    #     exit 1
    #   fi
    #   cp "$WALLPAPER" ${confDir}/assets/wallpaper.jpg
    #   wallust run "$WALLPAPER"
    #   nh os switch
    # '';
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
          target = "${palettePath}";
        };
      };
    };
  };
}
