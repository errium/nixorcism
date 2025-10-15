{
  description = "Monsterflake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }@inputs:
    {
      nixosConfigurations.virtual-nix = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/virtual-nix/configuration.nix
        ];
      };
    };
}
