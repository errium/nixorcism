{
  flake.modules.nixos.feature_styling = {inputs, ...}: {
    imports = [inputs.matugen.nixosModules.default];

    programs.matugen = {
      enable = true;

      source_color = "#ff1243";

      # TODO: Add a script for switching
      # wallpaper = ./../../../assets/wallpaper.jpg;
    };
  };
}
