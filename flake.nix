{
  description = "I need a nixorcism!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    username = "errium";

    mkSystem = hostname:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username;};
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit inputs username;};
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          ./hosts/${hostname}/configuration.nix
        ];
      };
  in {
    nixosConfigurations = {
      dudos-machine = mkSystem "dudos-machine";
      virtual-nix = mkSystem "virtual-nix";
    };
  };
}
