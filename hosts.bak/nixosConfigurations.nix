{inputs, ...}: {
  flake.nixosConfigurations = let
    args = {inherit inputs username confDir;};
    confDir = "/home/${username}/nixorcism";
    username = "errium";

    mkSystem = hostname:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = args;
        modules = [
          # NOTE: Potential problem with this path
          ./hosts/${hostname}/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              extraSpecialArgs = args;
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
        ];
      };
  in {
    dudos-machine = mkSystem "dudos-machine";
    virtual-nix = mkSystem "virtual-nix";
  };
}
