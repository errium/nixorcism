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
      "sway/appearance.conf".source = config.impureDir + "/sway/config";
      "sway/inputs.conf".source = config.impureDir + "/sway/config";
      "sway/keybinds.conf".source = config.impureDir + "/sway/config";
      "sway/matugen.conf".source = "${config.programs.matugen.theme.files}/.config/sway/matugen.conf";
      "sway/misc.conf".source = config.impureDir + "/sway/config";
    };

    imports = [../_common.nix];
  };
}
