{inputs, ...}: {
  flake.modules.nixos.theming = {
    imports = [inputs.matugen.nixosModules.default];

    programs.matugen = {
      enable = true;
      jsonFormat = "hex";
      type = "scheme-tonal-spot";
      variant = "dark";
      # wallpaper = ./wallpaper.png;
    };
  };
}
