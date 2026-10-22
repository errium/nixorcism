{
  flake.modules.nixos.window-managers'swayfx = {
    config,
    pkgs,
    ...
  }: {
    programs.sway = {
      enable = true;
      extraOptions = ["--unsupported-gpu"];
      package = pkgs.swayfx;
      wrapperFeatures.base = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = true;
    };

    hj.xdg.config.files = {
      "sway/config".source = config.impureDir + "/sway/config";
      "sway/appearance.conf".source = config.impureDir + "/sway/appearance.conf";
      "sway/inputs.conf".source = config.impureDir + "/sway/inputs.conf";
      "sway/keybinds.conf".source = config.impureDir + "/sway/keybinds.conf";
      "sway/misc.conf".source = config.impureDir + "/sway/misc.conf";

      "sway/matugen.conf".source = "${config.programs.matugen.theme.files}/.config/sway/matugen.conf";
    };

    imports = [../_common.nix];
  };
}
