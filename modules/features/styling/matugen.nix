{
  flake.modules.nixos.feature_styling = {inputs, ...}: {
    imports = [inputs.matugen.nixosModules.default];

    programs.matugen = {
      enable = true;

      # TODO: Add a script for switching
      wallpaper = ../../../assets/wallpaper.jpg; 
      
      jsonFormat = "hex";
      type = "scheme-tonal-spot";
      variant = "dark";
    };
  };
}
