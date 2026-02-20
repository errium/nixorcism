{
  config,
  inputs,
  ...
}: let
  args = {inherit inputs username confDir;};
  confDir = "/home/${username}/nixorcism";
  username = "errium";

  mkSystem = hostname:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = args;
      modules = [
        config.flake.modules.nixos.${hostname}
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
  flake.nixosConfigurations = {
    dudos-machine = mkSystem "dudos-machine";
    virtual-nix = mkSystem "virtual-nix";
  };
}
