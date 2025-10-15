{
  description = "Monsterflake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.virtual-nix = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/configuration.nix
      ];
    };
  };
}
