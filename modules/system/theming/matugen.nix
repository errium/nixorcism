{inputs, ...}: {
  # This module is imported by default in hosts/nixos-configurations.nix,
  # so I don't need any conditionals for my theming.
  flake.modules.nixos.system'theming = {
    imports = [inputs.matugen.nixosModules.default];

    config.programs.matugen = {
      enable = true;
      jsonFormat = "hex";
      type = "scheme-tonal-spot";
      variant = "dark";
      wallpaper = ./wallpaper.png;
    };
  };
}
