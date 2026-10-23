{
  flake.modules.nixos.window-managers'swayfx = {
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
        "sway/matugen.conf".source = "${config.programs.matugen.theme.files}/.config/sway/matugen.conf";
      };
    };

    imports = [../_common.nix];
  };
}
