{
  config,
  inputs,
  lib,
  ...
}: let
  accent = "teal";
  flavor = "frappe";
in {
  imports = [inputs.catppuccin.nixosModules.catppuccin];

  options.nixorcism.misc = {
    catppuccin.enable = lib.mkEnableOption "Whether to enable catppuccin theming";
  };

  config = lib.mkIf config.nixorcism.misc.catppuccin.enable {
    catppuccin = {
      enable = true;
      accent = accent;
      flavor = flavor;
      cursors = {
        enable = true;
        accent = "dark";
        flavor = flavor;
      };
    };

    hm = {
      imports = [inputs.catppuccin.homeModules.catppuccin];
      catppuccin = {
        enable = true;
        accent = accent;
        flavor = flavor;
      };
    };
  };
}
