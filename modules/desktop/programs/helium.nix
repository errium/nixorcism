{inputs, ...}: {
  flake.modules.nixos.programs'helium = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.helium.packages.${pkgs.system}.default
    ];
  };
}
