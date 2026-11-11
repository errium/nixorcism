{config, ...}: let
  modules = config.flake.modules.nixos;
in {
  flake.modules.nixos.window-managers'sway = {
    config,
    pkgs,
    lib,
    ...
  }: {
    options.nixorcism.sway.extraConfig = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Additional lines included in the Sway config.";
    };

    config = {
      programs.sway = {
        enable = true;
        extraOptions = ["--unsupported-gpu"];
        package = pkgs.swayfx;
        wrapperFeatures.base = true;
        wrapperFeatures.gtk = true;
        xwayland.enable = true;
      };

      hj.xdg.config.files."sway/config".text = ''
        include appearance.conf
        include keybinds.conf
        include misc.conf
        include extra.conf
        include matugen.conf
      '';

      hj.xdg.config.files = {
        "sway/appearance.conf".source = config.impureDir + "/sway/appearance.conf";
        "sway/keybinds.conf".source = config.impureDir + "/sway/keybinds.conf";
        "sway/misc.conf".source = config.impureDir + "/sway/misc.conf";
        "sway/extra.conf".text = config.nixorcism.sway.extraConfig;
      };

      nixorcism.theming.templates."sway.conf" = ".config/sway/matugen.conf";
    };

    imports =
      [../_common.nix]
      ++ (with modules; [
        programs'foot
        programs'noctalia
      ]);
  };
}
